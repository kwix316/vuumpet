<%@ page import="java.io.*, java.util.*, org.apache.commons.fileupload.*, org.apache.commons.fileupload.disk.*" %>
<%@ page contentType="application/json; charset=UTF-8" %>
<%
    DiskFileUpload upload = new DiskFileUpload();
    upload.setSizeMax(10 * 1024 * 1024); // 10MB 제한
    List items = upload.parseRequest(request);
    String uploadPath = application.getRealPath("/uploads");
    File uploadDir = new File(uploadPath);
    if (!uploadDir.exists()) uploadDir.mkdir();

    String fileUrl = "";
    String fileName = "";
    for (Object itemObj : items) {
        FileItem item = (FileItem) itemObj;
        if (!item.isFormField()) {
            fileName = System.currentTimeMillis() + "_" + item.getName();
            File uploadedFile = new File(uploadPath + File.separator + fileName);
            item.write(uploadedFile);
            fileUrl = request.getContextPath() + "/uploads/" + fileName; // 전체 URL 반환
            System.out.println(fileUrl);
        }
    }

    // CKEditor 5가 요구하는 JSON 응답 형식
    out.print("{ \"url\": \"" + fileUrl + "\" }");
%>