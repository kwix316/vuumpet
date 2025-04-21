<%@page import="org.apache.commons.text.StringEscapeUtils"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@page import="sql.Database"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Product Update</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <link rel="stylesheet" href="../css/font.css">
    <link rel="stylesheet" href="../css/index.css">
    <link rel="stylesheet" href="../css/footer.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css" integrity="sha512-Evv84Mr4kqVGRNSgIGL/F/aIDqQb7xQ2vcrdIwxfjThSH8CSR7PBEakCr51Ck+w+/U6swU2Im1vVX0SVk9ABhg==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link rel="stylesheet" href="menu.css">
    <link rel="stylesheet" href="https://cdn.ckeditor.com/ckeditor5/44.2.1/ckeditor5.css">
</head>
<body>
    <body>
    <%@include file="menu.jsp" %>
    <%
        String idx = request.getParameter("idx");
        // 입력값 검증: idx가 숫자인지 확인
        if (idx == null || idx.trim().isEmpty() || !idx.matches("\\d+")) {
            out.println("<div class='alert alert-danger'>잘못된 제품 ID입니다.</div>");
            return;
        }

        Database db = new Database();
        // 쿼리에 idx를 직접 삽입 (임시, SQL injection 주의)
        String productQuery = "WHERE id = '" + idx + "'";
        Map<String, Object> productQueryResult = db.SelectQuery("vuumpet_product", productQuery);
        boolean success = (boolean) productQueryResult.get("success");
        String product_name = "";
        String product_thumbnail = "";
        String product_price = "";
        String product_info = "";
        String product_details = "";
        String product_stock = "";
        String category_id = "";
        boolean hasOptions = false;
        Map<String, Object> optionQueryResult = null;

        if (success) {
            List<String[]> productInfo = (List<String[]>) productQueryResult.get("results");
            if (!productInfo.isEmpty()) {
                String[] product = productInfo.get(0);
                product_name = product[1] != null ? product[1] : ""; // product_name
                product_thumbnail = product[2] != null ? product[2] : ""; // product_thumbnail
                product_price = product[3] != null ? product[3] : ""; // product_price
                product_info = product[4] != null ? product[4] : ""; // product_info
                product_details = product[5] != null ? product[5] : ""; // product_details
                product_stock = product[6] != null ? product[6] : ""; // product_stock
                category_id = product[7] != null ? product[7] : ""; // category_id
            }

            // 제품 옵션 조회
            String optionQuery = "WHERE product_id = '" + idx + "'";
            optionQueryResult = db.SelectQuery("vuumpet_product_option", optionQuery);
            hasOptions = (boolean) optionQueryResult.get("success") && !((List<String[]>) optionQueryResult.get("results")).isEmpty();
        } else {
            out.println("<div class='alert alert-danger'>제품 정보를 불러오지 못했습니다.</div>");
            return;
        }
    %>
    <div class="container-fluid">
        <form action="product_update_process.jsp" method="post" enctype="multipart/form-data">
            <input type="hidden" class="form-control" id="product_id" name="product_id" value="<%= idx %>" required>
            <div class="my-5">
                <div class="mb-3">
                    <label for="product_name" class="form-label">제품명</label>
                    <input type="text" class="form-control" id="product_name" name="product_name" value="<%= StringEscapeUtils.escapeHtml4(product_name) %>" required>
                </div>
                <div class="mb-3">
                    <label for="use_option" class="form-check-label">제품 옵션 사용</label>
                    <input type="checkbox" id="use_option" class="form-check-input" <%= hasOptions ? "checked" : "" %>>
                </div>
                <div class="mb-3 border border-1 p-3 border-secondary" style="display: <%= hasOptions ? "block" : "none" %>;" id="option-section">
                    <div id="option-container" class="mb-3">
                        <%
                            if (hasOptions && optionQueryResult != null) {
                                List<String[]> options = (List<String[]>) optionQueryResult.get("results");
                                int optionIndex = 0;
                                for (String[] option : options) {
                                    String option_id = option[0]; // id
                                    // option_id 검증
                                    if (!option_id.matches("\\d+")) {
                                        continue; // 잘못된 option_id는 건너뜀
                                    }
                                    String option_name = option[2] != null ? option[2] : ""; // product_option_name
                                    String is_required = option[3] != null && option[3].equals("1") ? "checked" : ""; // is_required
                        %>
                        <div class="new-option mb-3" <%= optionIndex == 0 ? "id='option-container'" : "" %>>
                            <hr />
                            <label for="product_option_name" class="form-label">제품 옵션명</label>
                            <div class="input-group mb-2">
                                <input type="text" class="form-control" name="product_option_name[]" value="<%= StringEscapeUtils.escapeHtml4(option_name) %>" placeholder="제품 옵션명" required>
                                <button type="button" class="btn btn-outline-danger" onclick="removeOption(this)">옵션 삭제</button>
                            </div>
                            <div>
                                <input type="checkbox" class="form-check-input" name="is_required[]" value="1" <%= is_required %>>
                                <label class="form-check-label">필수 옵션</label>
                            </div>
                            <div class="option-values-container mb-3">
                                <label class="form-label">옵션값</label>
                                <%
                                    String optionValueQuery = "WHERE option_id = '" + option_id + "'";
                                    Map<String, Object> optionValueResult = db.SelectQuery("vuumpet_product_option_value", optionValueQuery);
                                    if ((boolean) optionValueResult.get("success")) {
                                        List<String[]> optionValues = (List<String[]>) optionValueResult.get("results");
                                        for (String[] value : optionValues) {
                                            String option_value = value[2] != null ? value[2] : ""; // option_value
                                            String option_stock = value[3] != null ? value[3] : "0"; // option_stock
                                            String option_price = value[4] != null ? value[4] : "0"; // option_price
                                %>
                                <div class="input-group mb-2">
                                    <input type="text" class="form-control" name="option_values_<%= optionIndex %>[]" value="<%= StringEscapeUtils.escapeHtml4(option_value) %>" placeholder="옵션값을 입력하세요" required>
                                    <input type="number" class="form-control" name="option_stocks_<%= optionIndex %>[]" value="<%= option_stock %>" placeholder="재고수를 입력하세요" min="0" required>
                                    <input type="number" class="form-control" name="option_prices_<%= optionIndex %>[]" value="<%= option_price %>" placeholder="가격을 입력하세요" min="0" required>
                                    <button type="button" class="btn btn-outline-danger" onclick="removeOptionValue(this)">삭제</button>
                                </div>
                                <%
                                        }
                                    }
                                %>
                                <button type="button" class="btn btn-outline-secondary" onclick="addOptionValue(this, <%= optionIndex %>)">옵션값 추가</button>
                            </div>
                        </div>
                        <%
                                    optionIndex++;
                                }
                            } else {
                        %>
                        <label for="product_option_name" class="form-label">제품 옵션명</label>
                        <div class="input-group mb-2">
                            <input type="text" class="form-control" id="product_option_name" name="product_option_name[]" placeholder="제품 옵션명">
                            <button type="button" class="btn btn-outline-secondary" onclick="addOption()">옵션 추가</button>
                        </div>
                        <div>
                            <input type="checkbox" class="form-check-input" name="is_required[]" value="1">
                            <label class="form-check-label">필수 옵션</label>
                        </div>
                        <div class="option-values-container mb-3" id="option-values-container">
                            <label class="form-label">옵션값</label>
                            <div class="input-group mb-2">
                                <input type="text" class="form-control" name="option_values_0[]" placeholder="옵션값을 입력하세요">
                                <input type="number" class="form-control" name="option_stocks_0[]" placeholder="재고수를 입력하세요" min="0">
                                <input type="number" class="form-control" name="option_prices_0[]" placeholder="가격을 입력하세요" min="0">
                                <button type="button" class="btn btn-outline-secondary" onclick="addOptionValue(this, 0)">옵션값추가</button>
                            </div>
                        </div>
                        <%
                            }
                        %>
                    </div>
                </div>
                <hr/>
                <div class="mb-3">
                    <label for="use_option_sale" class="form-check-label">제품 할인 옵션 사용</label>
                    <input type="checkbox" id="use_option_sale" class="form-check-input">
                </div>
                <div class="mb-3 border border-1 p-3 border-secondary" style="display: none;" id="option-sale-section">
                    <label for="product_option_sale" class="form-label">제품 할인 금액</label>
                    <input type="number" class="form-control" id="product_option_sale" name="product_option_sale" min="0">
                </div>
                <div class="mb-3">
                    <label for="product_img" class="form-label">제품 이미지</label>
                    <input type="file" class="form-control" id="product_img" accept="image/*" name="product_thumbnail">
                </div>
                <div class="mb-3">
                    <label for="product_price" class="form-label">제품가격</label>
                    <input type="number" class="form-control" id="product_price" name="product_price" value="<%= product_price %>" required>
                </div>
                <div class="mb-3">
                    <label class="form-label">제품 설명</label>
                    <textarea name="product_info" id="product-info-editor"></textarea>
                </div>
                <div class="mb-3">
                    <label class="form-label">제품 상세 정보</label>
                    <textarea name="product_details" id="product-details-editor"></textarea>
                </div>
                <div class="mb-3" id="stock-section">
                    <label for="product_stock" class="form-label">제품 재고수</label>
                    <input type="number" class="form-control" id="product_stock" name="product_stock" value="<%= product_stock %>" <%= hasOptions ? "" : "required" %>>
                </div>
                <div class="mb-3">
                    <select name="category" class="form-control">
                        <%
                            Map<String, Object> queryResult = db.SelectQuery("vuumpet_category", "");
                            success = (boolean) queryResult.get("success");
                            if (success) {
                                List<String[]> results = (List<String[]>) queryResult.get("results");
                                for (String[] category : results) {
                                    String currentCategoryId = category[0]; // id
                                    String categoryName = category[1]; // category_name
                                    String selected = currentCategoryId.equals(category_id) ? "selected" : "";
                        %>
                        <option value="<%= currentCategoryId %>" <%= selected %>><%= categoryName %></option>
                        <%
                                }
                            } else {
                        %>
                        <option value="">카테고리를 불러오지 못했습니다.</option>
                        <%
                            }
                        %>
                    </select>
                </div>
                <div class="d-grid gap-2">
                    <button class="btn btn-primary" type="submit">수정</button>
                </div>
            </div>
        </form>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
    <script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
    <script src="https://cdn.ckeditor.com/ckeditor5/44.2.1/translations/ko.umd.js"></script>
    <script src="https://cdn.ckeditor.com/ckeditor5/44.2.1/ckeditor5.umd.js"></script>
    <script>
        const {
            ClassicEditor,
            Alignment,
            AutoImage,
            AutoLink,
            Autosave,
            SimpleUploadAdapter,
            BlockQuote,
            Bold,
            Essentials,
            FontBackgroundColor,
            FontColor,
            FontFamily,
            FontSize,
            HorizontalLine,
            ImageBlock,
            ImageCaption,
            ImageEditing,
            ImageInline,
            ImageInsert,
            ImageInsertViaUrl,
            ImageResize,
            ImageStyle,
            ImageTextAlternative,
            ImageToolbar,
            ImageUpload,
            ImageUtils,
            Indent,
            IndentBlock,
            Italic,
            Link,
            LinkImage,
            List,
            ListProperties,
            Paragraph,
            Strikethrough,
            TodoList,
            Underline,
            Code,
            RemoveFormat,
            Subscript,
            Superscript,
            Highlight
        } = window.CKEDITOR;

        const LICENSE_KEY = 'eyJhbGciOiJFUzI1NiJ9.eyJleHAiOjE3NzE4MDQ3OTksImp0aSI6ImE0NWJkOTJmLWFkYmMtNGZmYi1hMGMwLTlhN2FlZDM2OWU5OSIsInVzYWdlRW5kcG9pbnQiOiJodHRwczovL3Byb3h5LWV2ZW50LmNrZWRpdG9yLmNvbSIsImRpc3RyaWJ1dGlvbkNoYW5uZWwiOlsiY2xvdWQiLCJkcnVwYWwiXSwiZmVhdHVyZXMiOlsiRFJVUCJdLCJ2YyI6IjU5ZGQ4MDgzIn0.2fAvqDr0JM2VRKgpkISywPAleIVzc06HBCoUEFUG_85pWmyCy1eycwMlr-GF-synGYEqjvCYCPWw4gcVWRff6A';

        const editorConfig = {
            toolbar: {
                items: [
                    'fontSize',
                    'fontFamily',
                    'fontColor',
                    'fontBackgroundColor',
                    '|',
                    'bold',
                    'italic',
                    'underline',
                    '|',
                    'link',
                    'insertImage',
                    'blockQuote',
                    '|',
                    'alignment',
                    '|',
                    'bulletedList',
                    'numberedList',
                    'todoList',
                    'outdent',
                    'indent'
                ],
                shouldNotGroupWhenFull: false
            },
            plugins: [
                Alignment,
                AutoImage,
                AutoLink,
                Autosave,
                SimpleUploadAdapter,
                BlockQuote,
                Bold,
                Essentials,
                FontBackgroundColor,
                FontColor,
                FontFamily,
                FontSize,
                HorizontalLine,
                ImageBlock,
                ImageCaption,
                ImageEditing,
                ImageInline,
                ImageInsert,
                ImageInsertViaUrl,
                ImageResize,
                ImageStyle,
                ImageTextAlternative,
                ImageToolbar,
                ImageUpload,
                ImageUtils,
                Indent,
                IndentBlock,
                Italic,
                Link,
                LinkImage,
                List,
                ListProperties,
                Paragraph,
                Strikethrough,
                TodoList,
                Underline
            ],
            simpleUpload: {
                uploadUrl: './uploadImage.jsp',
            },
            fontFamily: {
                options: [
                    'ScoreDreamExLight',
                    'ScoreDreamLight',
                    'ScoreDreamRegular',
                    'ScoreDreamMedium',
                    'ScoreDreamBold',
                    'ScoreDreamExBold',
                ]
            },
            fontSize: {
                options: [10, 11, 12, 13, 14, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25],
                supportAllValues: true
            },
            alignment: {
	            options: [
	                { name: 'left', className: 'text-start' },
	                { name: 'center', className: 'text-center' },
	                { name: 'right', className: 'text-end' }
	            ]
            },
            image: {
                toolbar: [
                    'toggleImageCaption',
                    'imageTextAlternative',
                    '|',
                    'imageStyle:inline',
                    'imageStyle:wrapText',
                    'imageStyle:breakText',
                    '|',
                    'imageStyle:alignLeft',
                    'imageStyle:alignCenter',
                    'imageStyle:alignRight',
                    '|',
                    'resizeImage'
                ]
            },
            initialData: "<%= StringEscapeUtils.escapeEcmaScript(product_details) %>",
            language: { ui: 'ko', content: 'ko' },
            licenseKey: LICENSE_KEY,
            link: {
                addTargetToExternalLinks: true,
                defaultProtocol: 'https://',
                decorators: {
                    toggleDownloadable: {
                        mode: 'manual',
                        label: 'Downloadable',
                        attributes: {
                            download: 'file'
                        }
                    }
                }
            },
            list: {
                properties: {
                    styles: true,
                    startIndex: true,
                    reversed: true
                }
            },
            menuBar: {
                isVisible: true
            },
            placeholder: '여기에 내용을 입력하세요!'
        };

        const editorConfig2 = {
            toolbar: {
                items: [
                    'fontSize',
                    'fontFamily',
                    'fontColor',
                    'fontBackgroundColor',
                    '|',
                    'bold',
                    'italic',
                    'underline',
                    'strikethrough',
                    'subscript',
                    'superscript',
                    'code',
                    'removeFormat',
                    '|',
                    'horizontalLine',
                    'highlight',
                    '|',
                    'alignment'
                ],
                shouldNotGroupWhenFull: false
            },
            plugins: [
                Alignment,
                Autosave,
                Bold,
                Code,
                Essentials,
                FontBackgroundColor,
                FontColor,
                FontFamily,
                FontSize,
                Highlight,
                HorizontalLine,
                Italic,
                Paragraph,
                RemoveFormat,
                Strikethrough,
                Subscript,
                Superscript,
                Underline
            ],
            fontFamily: {
                options: [
                    'ScoreDreamExLight',
                    'ScoreDreamLight',
                    'ScoreDreamRegular',
                    'ScoreDreamMedium',
                    'ScoreDreamBold',
                    'ScoreDreamExBold',
                ]
            },
            fontSize: {
                options: [10, 11, 12, 13, 14, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25],
                supportAllValues: true
            },
            initialData: "<%= StringEscapeUtils.escapeEcmaScript(product_info) %>",
            language: 'ko',
            licenseKey: LICENSE_KEY,
            placeholder: '여기에 내용을 입력하세요!'
        };

        ClassicEditor.create(document.querySelector('#product-info-editor'), editorConfig2)
            .then(editor => console.log('Product Info Editor initialized', editor))
            .catch(error => console.error('Error initializing Product Info Editor:', error));

        ClassicEditor.create(document.querySelector('#product-details-editor'), editorConfig)
            .then(editor => console.log('Product Details Editor initialized', editor))
            .catch(error => console.error('Error initializing Product Details Editor:', error));

        function addOptionValue(button, index) {
            const container = button.closest('.new-option')?.querySelector('.option-values-container') || document.getElementById('option-values-container');
            const inputGroup = document.createElement('div');
            inputGroup.className = 'input-group mb-2';
            inputGroup.innerHTML = `
                <input type="text" class="form-control" name="option_values_\${index}[]" placeholder="옵션값을 입력하세요" required>
                <input type="number" class="form-control" name="option_stocks_\${index}[]" placeholder="재고수를 입력하세요" min="0" required>
                <input type="number" class="form-control" name="option_prices_\${index}[]" placeholder="가격을 입력하세요" min="0" required>
                <button type="button" class="btn btn-outline-danger" onclick="removeOptionValue(this)">삭제</button>
            `;
            container.appendChild(inputGroup);
        }

        function removeOptionValue(button) {
            button.parentElement.remove();
        }

        function toggleOptionFields() {
            const useOption = document.getElementById('use_option');
            const optionSection = document.getElementById('option-section');
            const productStock = document.getElementById('product_stock');

            const optionInputs = optionSection.querySelectorAll('input:not([type="checkbox"])');

            if (useOption.checked) {
                optionSection.style.display = 'block';
                optionInputs.forEach(input => input.setAttribute('required', 'required'));
                productStock.removeAttribute('required');
            } else {
                optionSection.style.display = 'none';
                optionInputs.forEach(input => input.removeAttribute('required'));
                productStock.setAttribute('required', 'required');
            }
        }

        function toggleSaleFields() {
            const useOptionSale = document.getElementById('use_option_sale');
            const optionSaleSection = document.getElementById('option-sale-section');

            const saleInputs = optionSaleSection.querySelectorAll('input');

            if (useOptionSale.checked) {
                optionSaleSection.style.display = 'block';
                saleInputs.forEach(input => input.setAttribute('required', 'required'));
            } else {
                optionSaleSection.style.display = 'none';
                saleInputs.forEach(input => input.removeAttribute('required'));
            }
        }

        function addOption() {
            const optionSection = document.getElementById('option-section');
            const newOptionDiv = document.createElement('div');
            const optionCount = optionSection.querySelectorAll('.new-option').length + 1;
            newOptionDiv.className = 'new-option mb-3';
            newOptionDiv.innerHTML = `
                <hr />
                <div class="mb-3">
                    <label for="product_option_name" class="form-label">제품 옵션명</label>
                    <div class="input-group mb-2">
                        <input type="text" class="form-control" name="product_option_name[]" placeholder="제품 옵션명" required>
                        <button type="button" class="btn btn-outline-danger" onclick="removeOption(this)">옵션 삭제</button>
                    </div>
                    <div>
                        <input type="checkbox" class="form-check-input" name="is_required[]" value="1">
                        <label class="form-check-label">필수 옵션</label>
                    </div>
                </div>
                <div class="option-values-container mb-3">
                    <label class="form-label">옵션값</label>
                    <div class="input-group mb-2">
                        <input type="text" class="form-control" name="option_values_\${optionCount}[]" placeholder="옵션값을 입력하세요" required>
                        <input type="number" class="form-control" name="option_stocks_\${optionCount}[]" placeholder="재고수를 입력하세요" min="0" required>
                        <input type="number" class="form-control" name="option_prices_\${optionCount}[]" placeholder="가격을 입력하세요" min="0" required>
                        <button type="button" class="btn btn-outline-secondary" onclick="addOptionValue(this, \${optionCount})">옵션값 추가</button>
                    </div>
                </div>
            `;
            optionSection.appendChild(newOptionDiv);
        }

        function removeOption(button) {
            button.closest('.new-option').remove();
        }

        document.getElementById('use_option').addEventListener('change', toggleOptionFields);
        document.getElementById('use_option_sale').addEventListener('change', toggleSaleFields);
    </script>
</body>
</html>