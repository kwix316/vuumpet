<%@page import="java.util.HashMap"%>
<%@page import="java.io.File"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Arrays"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Map"%>
<%@page import="sql.Database"%>
<%@page import="org.apache.commons.fileupload.*"%>
<%@page import="org.apache.commons.fileupload.disk.*"%>
<%@page import="org.apache.commons.fileupload.servlet.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>product_addprocess.jsp</title>
</head>
<body>
<%
    request.setCharacterEncoding("utf-8");

    // 멀티파트 요청 확인
    if (!ServletFileUpload.isMultipartContent(request)) {
        response.sendRedirect("error.jsp?message=multipart/form-data가 아닙니다.");
        return;
    }

    // DiskFileUpload 설정
    DiskFileUpload upload = new DiskFileUpload();
    upload.setSizeMax(20 * 1024 * 1024); // 20MB 제한
    upload.setSizeThreshold(1024 * 1024); // 1MB 메모리 버퍼
    upload.setRepositoryPath(System.getProperty("java.io.tmpdir"));

    // 멀티파트 데이터 파싱
    List<FileItem> items = upload.parseRequest(request);

    // 폼 필드와 파일 분리
    String product_name = null;
    String product_thumbnail = null;
    String product_price = null;
    String product_info = null;
    String product_details = null;
    String selectedCategory = null;
    String product_stock = null;
    List<String> product_option_names = new ArrayList<>();
    List<String> product_option_is_requireds = new ArrayList<>();
    Map<String, List<String>> optionValuesMap = new HashMap<>();
    Map<String, List<String>> optionStocksMap = new HashMap<>();
    Map<String, List<String>> optionPricesMap = new HashMap<>();

    String uploadPath = application.getRealPath("/uploads");
    File uploadDir = new File(uploadPath);
    if (!uploadDir.exists()) uploadDir.mkdir();

    for (FileItem item : items) {
        if (item.isFormField()) {
            String fieldName = item.getFieldName();
            String value = item.getString("UTF-8");
            if ("product_name".equals(fieldName)) product_name = value;
            else if ("product_price".equals(fieldName)) product_price = value;
            else if ("product_info".equals(fieldName)) product_info = value;
            else if ("product_details".equals(fieldName)) product_details = value;
            else if ("category".equals(fieldName)) selectedCategory = value;
            else if ("product_stock".equals(fieldName)) product_stock = value;
            else if (fieldName.startsWith("product_option_name[")) {
            	if (value != null && !value.trim().isEmpty()) {
                    product_option_names.add(value);
                }
            }else if (fieldName.startsWith("is_required[")) product_option_is_requireds.add(value);
            else if (fieldName.startsWith("option_values_")) {
            	String index = fieldName.replace("option_values_", "").replace("[]", "");
                if (value != null && !value.trim().isEmpty()) {
                    optionValuesMap.computeIfAbsent(index, k -> new ArrayList<>()).add(value);
                }
            } else if (fieldName.startsWith("option_stocks_")) {
                String index = fieldName.replace("option_stocks_", "").replace("[]", "");
                if (value != null && !value.trim().isEmpty()) {
                	optionStocksMap.computeIfAbsent(index, k -> new ArrayList<>()).add(value);
                }
            } else if (fieldName.startsWith("option_prices_")) {
                String index = fieldName.replace("option_prices_", "").replace("[]", "");
                if (value != null && !value.trim().isEmpty()) {
                	optionPricesMap.computeIfAbsent(index, k -> new ArrayList<>()).add(value);
                }
            }
        } else {
            if ("product_thumbnail".equals(item.getFieldName()) && item.getSize() > 0) {
                String fileName = System.currentTimeMillis() + "_" + item.getName();
                File uploadedFile = new File(uploadPath + File.separator + fileName);
                item.write(uploadedFile);
                product_thumbnail = request.getContextPath() + "/uploads/" + fileName; // 썸네일 경로만 저장
            }
        }
    }

    Database db = new Database();

    // 제품 정보 삽입
    String[] columns = {"product_name", "product_thumbnail", "product_price", "product_info", "product_details", "product_stock", "category_id"};
    String[] types = {"string", "string", "int", "string", "string", "int", "int"};
    String[] values = new String[] {
        product_name,
        product_thumbnail, // 썸네일은 여기서만 저장
        product_price,
        (product_info == null || product_info.isEmpty()) ? null : product_info,
        product_details,
        (product_stock == null || product_stock.isEmpty()) ? "0" : product_stock,
        selectedCategory
    };

    boolean check = db.InsertQuery("vuumpet_product", columns, values, types);
    if (check) {
        String query = "WHERE product_name='" + product_name + "' AND product_price=" + product_price + " AND ROWNUM = 1";
        Map<String, Object> queryResult = db.SelectQuery("vuumpet_product", query);
        boolean success = (boolean) queryResult.get("success");

        if (success) {
            List<String[]> results = (List<String[]>) queryResult.get("results");
            String product_id = results.get(0)[0];
            // 제품 옵션 삽입
      	 	if (product_option_names != null && !product_option_names.isEmpty()) {
            	System.out.println("옵션값이 true");
                String[] columnsOption = {"product_id", "product_option_name", "is_required"};
                String[] typesOption = {"int", "string", "int"};
                String[] columnsOptionValue = {"option_id", "option_value", "option_stock", "option_price"};
                String[] typesOptionValue = {"int", "string", "int", "int"};

                for (int i = 0; i < product_option_names.size(); i++) {
                    String isRequired = (i < product_option_is_requireds.size() && "1".equals(product_option_is_requireds.get(i))) ? "1" : "0";
                    String[] valuesOption = {product_id, product_option_names.get(i), isRequired};
                    boolean optionCheck = db.InsertQuery("vuumpet_product_option", columnsOption, valuesOption, typesOption);

                    if (optionCheck) {
                        String optionQuery = "WHERE product_id='" + product_id + "' AND product_option_name='" + product_option_names.get(i) + "' AND ROWNUM = 1";
                        Map<String, Object> optionResult = db.SelectQuery("vuumpet_product_option", optionQuery);
                        if ((boolean) optionResult.get("success")) {
                            List<String[]> optionResults = (List<String[]>) optionResult.get("results");
                            String option_id = optionResults.get(0)[0];

                            List<String> optionValues = optionValuesMap.getOrDefault(String.valueOf(i), new ArrayList<>());
                            List<String> optionStocks = optionStocksMap.getOrDefault(String.valueOf(i), new ArrayList<>());
                            List<String> optionPrices = optionPricesMap.getOrDefault(String.valueOf(i), new ArrayList<>());

                            for (int j = 0; j < optionValues.size(); j++) {
                                String[] valuesOptionValue = {
                                    option_id,
                                    optionValues.get(j),
                                    j < optionStocks.size() ? optionStocks.get(j) : "0",
                                    j < optionPrices.size() ? optionPrices.get(j) : "0"
                                };
                                db.InsertQuery("vuumpet_product_option_value", columnsOptionValue, valuesOptionValue, typesOptionValue);
                            }
                        }
                    }
                }
            }else{
            	  System.out.println("옵션값이 비어 있음");
            }
        }
    }
    response.sendRedirect("products.jsp");
%>
</body>
</html>