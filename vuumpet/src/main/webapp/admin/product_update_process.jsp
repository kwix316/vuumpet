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
<title>product_update_process.jsp</title>
</head>
<body>
<%
    request.setCharacterEncoding("utf-8");

    // 멀티파트 요청 확인
    if (!ServletFileUpload.isMultipartContent(request)) {
        response.sendRedirect("error.jsp?message=multipart/form-data가%20아닙니다.");
        return;
    }

    // DiskFileUpload 설정
    DiskFileUpload upload = new DiskFileUpload();
    upload.setSizeMax(20 * 1024 * 1024); // 20MB 제한
    upload.setSizeThreshold(1024 * 1024); // 1MB 메모리 버퍼
    upload.setRepositoryPath(System.getProperty("java.io.tmpdir"));

    // 멀티파트 데이터 파싱
    List<FileItem> items;
    try {
        items = upload.parseRequest(request);
    } catch (FileUploadException e) {
        e.printStackTrace();
        response.sendRedirect("error.jsp?message=파일%20업로드%20오류");
        return;
    }

    // 폼 필드와 파일 분리
    String product_id = null;
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
            if ("product_id".equals(fieldName)) product_id = value;
            else if ("product_name".equals(fieldName)) product_name = value;
            else if ("product_price".equals(fieldName)) product_price = value;
            else if ("product_info".equals(fieldName)) product_info = value;
            else if ("product_details".equals(fieldName)) product_details = value;
            else if ("category".equals(fieldName)) selectedCategory = value;
            else if ("product_stock".equals(fieldName)) product_stock = value;
            else if (fieldName.startsWith("product_option_name[")) {
                if (value != null && !value.trim().isEmpty()) {
                    product_option_names.add(value);
                }
            } else if (fieldName.startsWith("is_required[")) {
                product_option_is_requireds.add(value != null && "1".equals(value) ? "1" : "0");
            } else if (fieldName.startsWith("option_values_")) {
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
                try {
                    item.write(uploadedFile);
                    product_thumbnail = request.getContextPath() + "/uploads/" + fileName;
                } catch (Exception e) {
                    e.printStackTrace();
                    response.sendRedirect("error.jsp?message=파일%20저장%20오류");
                    return;
                }
            }
        }
    }

    // 입력값 검증
    if (product_id == null || !product_id.matches("\\d+")) {
        response.sendRedirect("error.jsp?message=잘못된%20제품%20ID");
        return;
    }
    if (product_name == null || product_name.trim().isEmpty()) {
        response.sendRedirect("error.jsp?message=제품명이%20비어%20있습니다");
        return;
    }
    if (product_price == null || !product_price.matches("\\d+")) {
        response.sendRedirect("error.jsp?message=잘못된%20가격%20형식");
        return;
    }
    if (selectedCategory == null || !selectedCategory.matches("\\d+")) {
        response.sendRedirect("error.jsp?message=잘못된%20카테고리");
        return;
    }
    if (product_stock == null || product_stock.trim().isEmpty()) {
        product_stock = "0"; // 기본값
    } else if (!product_stock.matches("\\d+")) {
        response.sendRedirect("error.jsp?message=잘못된%20재고%20형식");
        return;
    }

    Database db = new Database();

    // 기존 썸네일 조회
    String existingThumbnail = null;
    String query = "WHERE id = '" + product_id + "'";
    Map<String, Object> queryResult = db.SelectQuery("vuumpet_product", query);
    if ((boolean) queryResult.get("success")) {
        List<String[]> results = (List<String[]>) queryResult.get("results");
        if (!results.isEmpty()) {
            existingThumbnail = results.get(0)[2]; // product_thumbnail
        }
    }

    // 제품 정보 업데이트
    String[] columns = {"product_name", "product_thumbnail", "product_price", "product_info", "product_details", "product_stock", "category_id"};
    String[] types = {"string", "string", "int", "string", "string", "int", "int"};
    String[] values = {
        product_name,
        product_thumbnail != null ? product_thumbnail : existingThumbnail, // 새 썸네일 없으면 기존 유지
        product_price,
        product_info != null ? product_info : null,
        product_details != null ? product_details : null,
        product_stock,
        selectedCategory
    };

    boolean check = db.UpdateQuery("vuumpet_product", columns, values, types, "id = '" + product_id + "'");
    if (check) {
        // 기존 옵션 삭제
        String deleteOptionValueQuery = "DELETE FROM vuumpet_product_option_value WHERE option_id IN (SELECT id FROM vuumpet_product_option WHERE product_id = '" + product_id + "')";
        db.DeleteQuery("vuumpet_product_option_value", "option_id IN (SELECT id FROM vuumpet_product_option WHERE product_id = '" + product_id + "')");
        db.DeleteQuery("vuumpet_product_option", "product_id = '" + product_id + "'");

        // 새 옵션 삽입
        if (!product_option_names.isEmpty()) {
            String[] columnsOption = {"product_id", "product_option_name", "is_required"};
            String[] typesOption = {"int", "string", "int"};
            String[] columnsOptionValue = {"option_id", "option_value", "option_stock", "option_price"};
            String[] typesOptionValue = {"int", "string", "int", "int"};

            for (int i = 0; i < product_option_names.size(); i++) {
                String isRequired = (i < product_option_is_requireds.size() && "1".equals(product_option_is_requireds.get(i))) ? "1" : "0";
                String[] valuesOption = {product_id, product_option_names.get(i), isRequired};
                boolean optionCheck = db.InsertQuery("vuumpet_product_option", columnsOption, valuesOption, typesOption);

                if (optionCheck) {
                    String optionQuery = "WHERE product_id = '" + product_id + "' AND product_option_name = '" + product_option_names.get(i) + "' AND ROWNUM = 1";
                    Map<String, Object> optionResult = db.SelectQuery("vuumpet_product_option", optionQuery);
                    if ((boolean) optionResult.get("success")) {
                        List<String[]> optionResults = (List<String[]>) optionResult.get("results");
                        if (!optionResults.isEmpty()) {
                            String option_id = optionResults.get(0)[0];

                            List<String> optionValues = optionValuesMap.getOrDefault(String.valueOf(i), new ArrayList<>());
                            List<String> optionStocks = optionStocksMap.getOrDefault(String.valueOf(i), new ArrayList<>());
                            List<String> optionPrices = optionPricesMap.getOrDefault(String.valueOf(i), new ArrayList<>());

                            for (int j = 0; j < optionValues.size(); j++) {
                                String stock = j < optionStocks.size() && optionStocks.get(j) != null && optionStocks.get(j).matches("\\d+") ? optionStocks.get(j) : "0";
                                String price = j < optionPrices.size() && optionPrices.get(j) != null && optionPrices.get(j).matches("\\d+") ? optionPrices.get(j) : "0";
                                String[] valuesOptionValue = {
                                    option_id,
                                    optionValues.get(j),
                                    stock,
                                    price
                                };
                                db.InsertQuery("vuumpet_product_option_value", columnsOptionValue, valuesOptionValue, typesOptionValue);
                            }
                        }
                    }
                }
            }
        }
        response.sendRedirect("products.jsp?success=true");
    } else {
        response.sendRedirect("error.jsp?message=제품%20업데이트%20실패");
    }
%>
</body>
</html>