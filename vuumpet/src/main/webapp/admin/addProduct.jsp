<%@page import="java.util.Map"%>
<%@page import="sql.Database"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Bootstrap demo</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <link rel="stylesheet" href="../css/font.css">
    <link rel="stylesheet" href="../css/index.css">
    <link rel="stylesheet" href="../css/footer.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css" integrity="sha512-Evv84Mr4kqVGRNSgIGL/F/aIDqQb7xQ2vcrdIwxfjThSH8CSR7PBEakCr51Ck+w+/U6swU2Im1vVX0SVk9ABhg==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link rel="stylesheet" href="menu.css">
    <link rel="stylesheet" href="https://cdn.ckeditor.com/ckeditor5/44.2.1/ckeditor5.css">
</head>
<body>
    <%@include file="menu.jsp" %>
    <div class="container-fluid">
	    <form action="product_addprocess.jsp" method="post" enctype="multipart/form-data">
	        <div class="my-5">
	            <div class="mb-3">
	                <label for="product_name" class="form-label">제품명</label>
	                <input type="text" class="form-control" id="product_name" name="product_name" required>
	            </div>
	            <div class="mb-3">
	                <label for="use_option" class="form-check-label">제품 옵션 사용</label>
	                <input type="checkbox" id="use_option" class="form-check-input">
	            </div>
	            <div class="mb-3 border border-1 p-3 border-secondary" style="display: none;" id="option-section">
	                <div id="option-container" class="mb-3">
	                	
	                    <label for="product_option_name" class="form-label">제품 옵션명</label>
	                    <div class="input-group mb-2">
	                        <input type="text" class="form-control" id="product_option_name" name="product_option_name[]" placeholder="제품 옵션명">
	                        <button type="button" class="btn btn-outline-secondary" onclick="addOption()">옵션 추가</button>
	                    </div>
	                    <div>
			                <input type="checkbox" class="form-check-input" name="is_required[]" value="1">
			                <label class="form-check-label">필수 옵션</label>
			            </div>
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
	                <input type="file" class="form-control" id="product_img" accept="image/*"  name="product_thumbnail" required>
	            </div>
	            <div class="mb-3">
	                <label for="product_price" class="form-label">제품가격</label>
	                <input type="number" class="form-control" id="product_price" name="product_price" required>
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
	                <input type="number" class="form-control" id="product_stock" name="product_stock" required>
	            </div>
	            <div class="mb-3">
	                <select name="category" class="form-control">
	                    <%
	                        Database db = new Database();
	                        Map<String, Object> queryResult = db.SelectQuery("vuumpet_category", "");
	                        boolean success = (boolean) queryResult.get("success");
	                        if (success) {
	                            List<String[]> results = (List<String[]>) queryResult.get("results");
	                    %>
	                            <%
	                                for (String[] category : results) {
	                            %>
	                            <option value="<%=category[0]%>"><%=category[1]%></option>
	                            <%
	                                }
	                            %>
	                    <%
	                        } else {
	                    %>
	                            <option value="">카테고리를 불러오지 못했습니다.</option>
	                    <%
	                        }
	                    %>
	                </select>
	            </div>
	            <div class="d-grid gap-2">
	                <button class="btn btn-primary" type="submit">추가</button>
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
	
			const LICENSE_KEY =
				'eyJhbGciOiJFUzI1NiJ9.eyJleHAiOjE3NzE4MDQ3OTksImp0aSI6Ijg2ZTkxODdiLWRlM2ItNGEzNS1iMGQ5LTJmMDlkMzUxMmIwZCIsImxpY2Vuc2VkSG9zdHMiOlsiMTI3LjAuMC4xIiwibG9jYWxob3N0IiwiMTkyLjE2OC4qLioiLCIxMC4qLiouKiIsIjE3Mi4qLiouKiIsIioudGVzdCIsIioubG9jYWxob3N0IiwiKi5sb2NhbCJdLCJ1c2FnZUVuZHBvaW50IjoiaHR0cHM6Ly9wcm94eS1ldmVudC5ja2VkaXRvci5jb20iLCJkaXN0cmlidXRpb25DaGFubmVsIjpbImNsb3VkIiwiZHJ1cGFsIl0sImxpY2Vuc2VUeXBlIjoiZGV2ZWxvcG1lbnQiLCJmZWF0dXJlcyI6WyJEUlVQIl0sInZjIjoiOTA4ZjJjNmYifQ.k3XtvT1n2ubIn2jpJnXav9aePOLN8V_oD4LRVpn-GuzsANbI9qzg44pNQGpDroOS-GnBLLmuZ5K-Au23JDp-Xg';
	
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
/* 					supportAllValues: true */
				},
				fontSize: {
					options: [10, 11, 12, 13, 14, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25],
					supportAllValues: true
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
				        'imageStyle:alignLeft',    // 왼쪽 정렬
				        'imageStyle:alignCenter',  // 가운데 정렬
				        'imageStyle:alignRight',   // 오른쪽 정렬
						'|',
						'resizeImage'
					]
				},
				initialData:
					'',
				language: {ui: 'ko', content: 'ko'},
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
	
/* 			ClassicEditor.create(document.querySelectorall('#editor'), editorConfig);
			 */

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
				initialData:
					"",
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
			
		</script>
		<script >
		    // 옵션값 추가
		    function addOptionValue(button, index) {
		        const container = button.closest('.new-option')?.querySelector('.option-values-container') || document.getElementById('option-values-container');
		        const inputGroup = document.createElement('div');
		        inputGroup.className = 'input-group mb-2';
		        inputGroup.innerHTML = `
		            <input type="text" class="form-control" name="option_values_\${index}[]" placeholder="옵션값을 입력하세요" required>
		            <input type="number" class="form-control" name="option_stocks_\${index}[]" placeholder="재고수를 입력하세요" required min="0">
		            <input type="number" class="form-control" name="option_prices_\${index}[]" placeholder="가격을 입력하세요" required min="0">
		            <button type="button" class="btn btn-outline-danger" onclick="removeOptionValue(this)">삭제</button>
		        `;
		        container.appendChild(inputGroup);
		    }
	
		    // 옵션값 제거
		    function removeOptionValue(button) {
		        button.parentElement.remove();
		    }
	
		    // 옵션 토글
		    function toggleOptionFields() {
			    const useOption = document.getElementById('use_option');
			    const optionSection = document.getElementById('option-section');
			    const productStock = document.getElementById('product_stock');
			
			    // option-section의 모든 입력 필드를 가져옵니다.
			    const optionInputs = optionSection.querySelectorAll('input');
			
			    if (useOption.checked) {
			        optionSection.style.display = 'block';

			        // option-section의 모든 입력 필드에 required 속성 추가
			       const optionInputs = optionSection.querySelectorAll('input:not([type="checkbox"])');
			        
			        productStock.removeAttribute('required');
			    } else {
			        optionSection.style.display = 'none';
			        
			        // option-section의 모든 입력 필드에서 required 속성 제거
			        optionInputs.forEach(input => input.removeAttribute('required'));
			        
			        productStock.setAttribute('required', 'required');
			    }
			}
	
		    // 할인 옵션 토글
		   	function toggleSaleFields() {
			    const useOptionSale = document.getElementById('use_option_sale');
			    const optionSaleSection = document.getElementById('option-sale-section');
			    
			    // option-sale-section의 모든 입력 필드를 가져옵니다.
			    const saleInputs = optionSaleSection.querySelectorAll('input');
			
			    if (useOptionSale.checked) {
			        optionSaleSection.style.display = 'block';
			
			        // option-sale-section의 모든 입력 필드에 required 속성 추가
			        saleInputs.forEach(input => input.setAttribute('required', 'required'));
			    } else {
			        optionSaleSection.style.display = 'none';
			
			        // option-sale-section의 모든 입력 필드에서 required 속성 제거
			        saleInputs.forEach(input => input.removeAttribute('required'));
			    }
			}
	
		    // 옵션 추가
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
			                <label class="form-check-label" >필수 옵션</label>
			            </div>
		            </div>
		            <div class="option-values-container mb-3">
		                <label class="form-label">옵션값</label>
		                <div class="input-group mb-2">
		                    <input type="text" class="form-control" name="option_values_\${optionCount}[]" placeholder="옵션값을 입력하세요" required>
		                    <input type="number" class="form-control" name="option_stocks_\${optionCount}[]" placeholder="재고수를 입력하세요" required min="0">
		                    <input type="number" class="form-control" name="option_prices_\${optionCount}[]" placeholder="가격을 입력하세요" required min="0">
		                    <button type="button" class="btn btn-outline-secondary" onclick="addOptionValue(this, \${optionCount})">옵션값 추가</button>
		                </div>
		            </div>
		        `;
		        optionSection.appendChild(newOptionDiv);
		    }
	
		    // 옵션 제거
		    function removeOption(button) {
		        button.closest('.new-option').remove();
		    }
	
		    // 체크박스 이벤트 리스너 추가
		    document.getElementById('use_option').addEventListener('change', toggleOptionFields);
		    document.getElementById('use_option_sale').addEventListener('change', toggleSaleFields);
		</script>
	</body>
</html>
