<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
	<html lang="en">
	<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport"
    	content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <title>所有訂單</title>

    <meta name="keywords" content="HTML5 Template" />
    <meta name="description" content="Porto - Bootstrap eCommerce Template">
    <meta name="author" content="SW-THEMES">

    <!-- Favicon -->
    <link rel="icon" type="image/x-icon" href="assets/images/icons/favicon.png">

    <!-- Plugins CSS File -->
    <link rel="stylesheet" href="assets/css/bootstrap.min.css">

    <!-- Main CSS File -->
    <link rel="stylesheet" href="assets/css/style.min.css">
    <link rel="stylesheet" type="text/css" href="assets/vendor/fontawesome-free/css/all.min.css">

    <style>
        * {
            box-sizing: border-box;
        }

        main {
            margin-bottom: 30px;
        }

        /* 左側導覽列 */
        .navbar {
            height: 250px;
            width: 120px;
            font-size: 18px;
            transition: background-color 0.3s, color 0.3s;
        }

        .navbar a:hover {
            background-color: #acbac7;
            border-radius: 10px;
            color: #fff;
        }

        .navbar a {
            margin: 6px 0;
        }

        .all_container {
            display: flex;
            justify-content: start;
            margin-bottom: 50px;
        }

        /* 中間區塊 */
        .container_middle {
            width: 100%;
            margin: 0 50px 0 30px;
        }

        /*  賣家簡介區域樣式 */
        #seller-intro {
            border: 1px solid #ddd;
            height: 300px;
            padding: 20px;
            margin-bottom: 20px;
        }

        .rating_contain {
            display: inline-block;
        }

        div.rating,
        .comment {
            display: inline-block;
        }

        .rating {
            font-size: 24px;
            color: #ecd243;
        }

        /* 所有搜尋 */
        .search {
            display: flex;
            justify-content: space-between;
        }

        input {
            padding: 4px;
            width: 180px;
            border: 1px solid #ddd;
            border-radius: 5px;
        }

        label {
            margin-right: 10px;
            font-size: 15px;
        }

        /* ===== 商品列表樣式 ===== */
        table {
            border-collapse: collapse;
            width: 100%;
            margin: 20px 0;
        }

        th,
        td {
            border: 1px solid #ddd;
            padding: 10px;
            text-align: left;
            text-align: center;
        }

        th {
            background-color: #f2f2f2;
        }

        img {
            max-width: 100%;
            height: auto;
        }

        tr:hover {
            background-color: #f5f5f5;
        }

        .btn {
            padding: 5px 10px;
            font-size: 12px;
        }
    </style>
</head>

<body>
    <div class="page-wrapper">
        <header class="header">
        </header><!-- End .header -->

        <main>
            <div class="page-header">
                <div class="container d-flex flex-column align-items-center">
                    <h1>所有訂單</h1>
                </div>
            </div>
        </main>
        <!-- End .main -->

        <!-- 所有區域 -->
        <div class="all_container">
            <!-- 左側區域 導覽列 -->
            <div>
                <nav class="navbar navbar-light bg-light flex-column">
                    <a class="nav-link" href="./asap_orders.html">所有訂單</a>
                    <a class="nav-link" href="./asap_items.html">商品管理</a>
                    <a class="nav-link" href="./asap_add_item.html">新增商品</a>
                    <a class="nav-link" href="./asap_comments.html">所有評論</a>
                    <a class="nav-link" href="#">私訊</a>
                </nav>
            </div>

            <!-- 中間區域 -->
            <div class="container_middle">
                <!-- 賣家簡介區域 -->
                <div id="seller-intro">
                    <div class="seller-intro-top">
                        <h3 class="id_name">tibame2023</h3>
                        <div class="seller-info">
                            <p>評分 : <span class="rating">4.5 <a href="./asap_comments.html"></span>(100)</p></a>
                            <p>加入日期 : 2023年11月1日</p>
                        </div>
                    </div>
                    <div class="seller-intro-bottom">
                        <h4 style="display:inline-block;">賣場簡介</h4>
                        <span data-toggle="modal" data-target="#editIntroModal" style="cursor: pointer;">編輯</span>
                        <div class="text">
                            這是賣家的簡介內容，可以包含更多資訊。這是賣家的簡介內容，可以包含更多資訊。這是賣家的簡介內容，可以包含更多資訊。這是賣家的簡介內容，可以包含更多資訊。這是賣家的簡介內容，可以包含更多資訊。這是賣家的簡介內容，可以包含更多資訊。這是賣家的簡介內容，可以包含更多資訊。這是賣家的簡介內容，可以包含更多資訊。這是賣家的簡介內容，可以包含更多資訊。這是賣家的簡介內容，可以包含更多資訊。
                        </div>
                    </div>
                </div>

                <h2>訂單列表</h2>
                <!-- 所有搜尋 -->
                <div class="search">
                    <!-- 文字搜尋列 -->
                    <div id="search-bar">
                        <label for="search-input">搜尋: </label>
                        <input type="text" id="search-input" placeholder="輸入搜尋關鍵字">
                    </div>

                    <!-- 日期搜尋列 -->
                    <div>
                        <label for="startDate">訂單成立日期:</label>
                        <input type="date" id="startDate" name="startDate" class="date-input">
                        ~
                        <input type="date" id="endDate" name="endDate" class="date-input">
                    </div>
                </div>

                <!-- 訂單列表 -->
                <table>
                    <thead>
                        <tr>
                            <th>訂單編號</th>
                            <th>訂單日期</th>
                            <th>收件人</th>
                            <th>出貨狀態</th>
                            <th>總金額</th>
                            <th>查詢明細</th>
                            <th>取消訂單</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>1</td>
                            <td>2023-11-10</td>
                            <td>user123</td>
                            <td>已出貨</td>
                            <td>$50.00</td>
                            <td><button type="button" class="btn btn-outline-primary" data-toggle="modal"
                                    data-target="#orderDetailsModal">查詢</button></td>
                            <td><button class="btn btn-outline-secondary cancelOrderBtn">取消</button></td>
                        </tr>
                        <tr>
                            <td>2</td>
                            <td>2023-11-11</td>
                            <td>user456</td>
                            <td>待出貨</td>
                            <td>$75.00</td>
                            <td><button type="button" class="btn btn-outline-primary" data-toggle="modal"
                                    data-target="#orderDetailsModal">查詢</button></td>
                            <td><button class="btn btn-outline-secondary cancelOrderBtn">取消</button></td>
                        </tr>
                        <!-- 添加更多訂單行 -->
                    </tbody>
                </table>
            </div>
        </div>
        <!-- End .all_container -->

        <!-- 查詢訂單詳情的模態框 -->
        <div class="modal fade" id="orderDetailsModal" tabindex="-1" role="dialog"
            aria-labelledby="orderDetailsModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="orderDetailsModalLabel">訂單詳細資訊</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <!-- 訂單詳情內容將顯示在這裡 -->
                        <table>
                            <thead>
                                <tr>
                                    <th>商品編號</th>
                                    <th>商品名稱</th>
                                    <th>價格</th>
                                    <th>數量</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <th>1001</th>
                                    <td>慢跑鞋</td>
                                    <td>$50</td>
                                    <td>1</td>
                                </tr>
                                <tr>
                                    <th>1002</th>
                                    <td>男上衣</td>
                                    <td>$150</td>
                                    <td>1</td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                    <span></span>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-outline-secondary" data-dismiss="modal">關閉</button>
                    </div>
                </div>
            </div>
        </div>

        <!-- 編輯賣場簡介的模態框 -->
        <div class="modal fade" id="editIntroModal" tabindex="-1" role="dialog" aria-labelledby="editIntroModalLabel"
            aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <label for="newIntro">編輯 - 賣場簡介：</label>
                        <textarea id="newIntro" class="form-control" rows="5"></textarea>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-outline-primary" id="saveIntroBtn">保存</button>
                        <button type="button" class="btn btn-outline-secondary" data-dismiss="modal">返回</button>
                    </div>
                </div>
            </div>
        </div>


        <footer class="footer bg-dark">
        </footer><!-- End .footer -->
    </div><!-- End .page-wrapper -->

    <div class="sticky-navbar"></div>

    <a id="scroll-top" href="#top" title="Top" role="button"><i class="icon-angle-up"></i></a>

    <!-- Plugins JS File -->
    <script src="assets/js/jquery.min.js"></script>
    <script src="assets/js/bootstrap.bundle.min.js"></script>
    <script src="assets/js/plugins.min.js"></script>

    <!-- Main JS File -->
    <script src="assets/js/main.min.js"></script>
    <script>

        $(document).ready(function () {
            $("header").load("header.html");
            $("footer").load("footer.html");
            $("div.sticky-navbar").load("sticky-navbar.html");
            $("div.mobile-menu-container").load("mobile-menu-container.html");

            // 編輯賣場簡介
            $("#editIntroModal").on("show.bs.modal", function (event) {
                var currentIntro = $("#seller-intro .text").text().trim();
                $("#newIntro").val(currentIntro);
            });

            $("#saveIntroBtn").click(function () {
                var newIntro = $("#newIntro").val();
                $("#seller-intro .text").text(newIntro);
                $('#editIntroModal').modal('hide');
            });
        });
    </script>
</body>

</html>