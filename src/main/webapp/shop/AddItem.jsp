<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />

    <title>新增商品</title>

    <meta name="keywords" content="HTML5 Template" />
    <meta name="description" content="Porto - Bootstrap eCommerce Template" />
    <meta name="author" content="SW-THEMES" />

    <!-- Favicon -->
    <link rel="icon" type="image/x-icon" href="assets/images/icons/favicon.png" />

    <!-- Plugins CSS File -->
    <link rel="stylesheet" href="assets/css/bootstrap.min.css" />

    <!-- Main CSS File -->
    <link rel="stylesheet" href="assets/css/style.min.css" />
    <link rel="stylesheet" type="text/css" href="assets/vendor/fontawesome-free/css/all.min.css" />

    <style>
        /* div {
        border: 1px solid black;
      } */

        main {
            margin-bottom: 30px;
        }

        .item_container {
            display: flex;
            justify-content: center;
            margin-bottom: 50px;
        }

        textarea {
            width: 600px;
            min-height: 200px;
        }

        .container_left {
            width: 800px;
        }

        .container_right {
            margin-left: 50px;
            width: 400px;
        }

        .btns button {
            margin: 0 5px;
            margin-left: 0;
        }

        hr {
            margin: 30px 0;
        }

        /* 照片拖曳 */
        input[disabled] {
            background-color: #eee;
            cursor: not-allowed;
        }

        #drop_zone {
            border: 1px dashed maroon;
            height: 100px;
            margin: 10px 0;
            position: relative;
        }

        #drop_zone span.text {
            position: absolute;
            display: inline-block;
            left: 50%;
            top: 50%;
            transform: translate(-50%, -50%);
            z-index: -1;
            color: lightgray;
        }

        #drop_zone.-on {
            border: 1px dashed lightblue;
            box-shadow: 3px 3px 5px lightblue inset, -3px -3px 5px lightblue inset;
        }

        #preview {
            border: 1px solid lightgray;
            display: inline-block;
            width: 300px;
            min-height: 150px;
            position: relative;
        }

        #preview span.text {
            position: absolute;
            display: inline-block;
            left: 50%;
            top: 50%;
            transform: translate(-50%, -50%);
            z-index: -1;
            color: lightgray;
        }

        #preview img.preview_img {
            width: 100%;
        }
    </style>
</head>

<body>
    <div class="page-wrapper">
        <header class="header"></header>
        <!-- End .header -->
        <main>
            <div class="page-header">
                <div class="container d-flex flex-column align-items-center">
                    <nav aria-label="breadcrumb" class="breadcrumb-nav">
                        <div class="container">
                            <ol class="breadcrumb">
                                <li class="breadcrumb-item"><a href="demo4.html">首頁</a></li>
                                <li class="breadcrumb-item"><a href="category.html">賣家入口</a></li>
                            </ol>
                        </div>
                    </nav>
                    <h1>新增商品</h1>
                </div>
            </div>
        </main>

        <div class="item_container">
            <!-- ========= 左邊區塊 ======== -->
            <div class="container_left">
            <form action="AddProductServlet" method="post" enctype="multipart/form-data">
            <!-- 商品名稱 -->
                <h4 for="product-name">
                    商品名稱
                    <input type="text" style="width: 400px" id="product-name" name="product_name" required />
                </h4>
                <h5>商品簡介</h5>
                <textarea id="product-description" required></textarea>

                <br />
                <br />

                <h5 for="product-condition">商品狀況</h5>
                <button type="button" class="btn btn-outline-primary">全新</button>
                <button type="button" class="btn btn-outline-primary">幾乎全新</button>
                <button type="button" class="btn btn-outline-primary">狀況良好</button>
                <button type="button" class="btn btn-outline-primary">狀況尚可</button>

                <hr>

                <div>
                    <h5>封面圖片</h5><input type="file" id="p_file">
                    <div id="drop_zone"><span class="text">圖片拖曳至此處</span></div>
                    <div id="preview"><span class="text">預覽圖</span></div>
                </div>

                <hr>

                <div>
                    <h5>上傳圖庫</h5><input type="file" id="product-video" name="product_video" accept="video/*" />
                    <div id="drop_zone"><span class="text">圖片拖曳至此處</span></div>
                    <div id="preview"><span class="text">預覽圖</span></div>
                    <br />
                </div>
                
                <!-- 發布按鈕 -->
                    <div class="btns">
                        <button class="btn btn-outline-primary" type="submit" name="action" value="publish">發佈</button>
                        <button class="btn btn-outline-primary" type="submit" name="action" value="draft">儲存草稿</button>
                        <button class="btn btn-outline-primary" type="button" onclick="preview()">預覽</button>
                    </div>
                </form>

            </div>

            <!-- ========= 右邊區塊 ======== -->
            <div class="container_right">
                <div class="container_right_top">
                    <div class="btns">
                        <button class="btn btn-outline-primary" type="submit" value="發布">發佈</button>
                        <button class="btn btn-outline-primary" type="submit" value="儲存草稿">儲存草稿</button>
                        <button class="btn btn-outline-primary" type="submit" value="預覽">預覽</button>
                    </div>
                </div>

                <hr>

                <p for="product-category">商品分類
                    <select id="product-category" name="product_category" style="width: 150px">
                        <option value="tops">上衣</option>
                        <option value="shoes">鞋子</option>
                        <option value="baseball">棒球</option>
                        <option value="basketball">籃球</option>
                    </select>
                </p>

                <p for="product-size">尺寸
                    <select id="product-category" name="product_category" style="width: 150px">
                        <option value="none">無</option>
                        <option value="S">S</option>
                        <option value="M">M</option>
                        <option value="L">L</option>
                        <option value="XL">XL</option>
                    </select>
                </p>

                <p for="product-price">價格 <input type="text" id="product-price" name="product_price" required /></p>
                <p for="product-price">前一次價格 <input type="text" id="product-price" name="product_price" required /></p>
                <p for="product-quantity">庫存 <input type="number" id="product-quantity" required /></p>


                <p for="product-brand">品牌 <input type="text" id="product-brand" name="product_brand" /></p>

                <p for="shipping-method">運送方式 </p><input type="checkbox" /> 宅配

            </div>
        </div>

        <footer class="footer bg-dark">
        </footer>
        <!-- End .footer -->
    </div>
    <!-- End .page-wrapper -->

    <div class="sticky-navbar">
        <div class="sticky-info">
            <a href="demo4.html">
                <i class="icon-home"></i>Home
            </a>
        </div>
        <div class="sticky-info">
            <a href="category.html" class="">
                <i class="icon-bars"></i>Categories
            </a>
        </div>
        <div class="sticky-info">
            <a href="wishlist.html" class="">
                <i class="icon-wishlist-2"></i>Wishlist
            </a>
        </div>
        <div class="sticky-info">
            <a href="login.html" class="">
                <i class="icon-user-2"></i>Account
            </a>
        </div>
        <div class="sticky-info">
            <a href="cart.html" class="">
                <i class="icon-shopping-cart position-relative">
                    <span class="cart-count badge-circle">3</span>
                </i>Cart
            </a>
        </div>
    </div>

    <a id="scroll-top" href="#top" title="Top" role="button"><i class="icon-angle-up"></i></a>

    <!-- Plugins JS File -->
    <script src="assets/js/jquery.min.js"></script>
    <script src="assets/js/bootstrap.bundle.min.js"></script>
    <script src="assets/js/plugins.min.js"></script>

    <!-- Main JS File -->
    <script src="assets/js/main.min.js"></script>

    <script>
        window.addEventListener("load", function (e) {

            $("header").load("header.html");
            $("footer").load("footer.html");
            $("div.sticky-navbar").load("sticky-navbar.html");
            $("div.mobile-menu-container").load("mobile-menu-container.html");


            // === Drag and Drop ===
            drop_zone_el = document.getElementById("drop_zone");
            drop_zone_el.addEventListener("dragover", function (e) {
                // console.log("...")
                e.preventDefault();
            })

            drop_zone_el.addEventListener("dragenter", function (e) {
                e.target.classList.add("-on");
            })

            drop_zone_el.addEventListener("dragleave", function (e) {
                e.target.classList.remove("-on");
            })

            drop_zone_el.addEventListener("drop", function (e) {
                e.preventDefault();
                e.target.classList.remove("-on");

                console.log(e.dataTransfer.files); // 取得files

                preview_img(e.dataTransfer.files[0]);
                p_file_el.value = "";     // 將type="file" 那個清空
            })

            // === 預覽圖 ===
            preview_el = document.getElementById("preview");
            p_file_el = document.getElementById("p_file");
            function preview_img(file) {
                reader = new FileReader(); // 用來讀取檔案
                reader.readAsDataURL(file);
                reader.addEventListener("load", function () {
                    let img_str = '<img src="' + reader.result + '"class="preview_img">';
                    preview_el.innerHTML = img_str;
                })
            }

            p_file_el.addEventListener("change", function (e) {
                if (this.files.length > 0) {
                    preview_img(this.files[0])
                } else {
                    preview_el.innerHTML = '<span class="text">預覽圖</span>';
                }
            })

        })
    </script>
</body>

</html>