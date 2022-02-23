<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>전자결재 > 기안문서조회 (문서상세)</title>
  <!-- Favicon -->
  <link rel="shortcut icon" href="${pageContext.request.contextPath}/resources/img/svg/looo.png" type="image/x-icon">
  <!-- Custom styles -->
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style.min.css">

  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/ea/user/ea_signuplist.css">

  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
</head>

<body>
  <%@ include file="/WEB-INF/views/common/headerSide.jsp" %>

  <div class="ea_wrapper">
    <div class="ea_signuplist_wrapper">
      <div class="ea_signuplist_title">
        <span>기안문서조회 (문서상세)</span>
      </div>
      <div class="ea_signuplist_detail_contents">
        <!-- 문서 좌상단 문서 정보 -->
        <div>
            <table>
                <tr>
                    <th>문서 번호 : </th>
                    <td>1</td>
                </tr>
                <tr>
                    <th>문서 제목 : </th>
                    <td>무슨무슨 법으로 고소합니다.</td>
                </tr>
                <tr>
                    <th>양식 : </th>
                    <td>비품구매서</td>
                </tr>
                <tr>
                    <th>상신 날짜 : </th>
                    <td>2022-02-22</td>
                </tr>
                <tr>
                    <th>마감 날짜 : </th>
                    <td>2022-02-31</td>
                </tr>
                <tr>
                    <th>진행 단계 : </th>
                    <td>1차 결재</td>
                </tr>
                <tr>
                    <th>보안 등급 : </th>
                    <td>A</td>
                </tr>
            </table>
        </div>
        <!-- 문서 우상단 문서 결재자 -->
        <div>
            <table>
                <tr>
                    <th>기안자</th>
                    <th>중간 결재자</th>
                    <th>최종 결재자</th>
                </tr>
                <tr>
                    <td>알파포대</td>
                    <td>브라보포대</td>
                    <td>HQ</td>
                </tr>
                <tr>
                    <td>
                        일병 이종훈<br>
                        <span>🐶</span>
                    </td>
                    <td>
                        중사 이종훈<br>
                        <span>🐧</span>
                    </td>
                    <td>
                        대위 이종훈<br>
                        <span>🦁</span>
                    </td>
                </tr>
            </table>
        </div>
        <!-- 문서 중앙 문서 내용 -->
        <div>
            <!-- 텍스트 에디터 저장된 html 코드 -->
            <h1 style="text-align: center;">비품구매서</h1><br><br><br>
            <table border="2" style="width: 80%; height: 200px; text-align: center; margin: auto;">
                <tr style="background: gray; border: 1px solid #262626;">
                    <th>구매 품목</th>
                    <th>가격</th>
                </tr>
                <tr>
                    <td>집행검</td>
                    <td>$999,999,999</td>
                </tr>
                <tr>
                    <td>엑스칼리버</td>
                    <td>$333,333,333</td>
                </tr>
            </table>
            <h2 style="text-align: center;">사주세요!!!!!!!!!!!!!!!!!!!!!!</h2>
            <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Eligendi dolor exercitationem aliquam amet aperiam ipsa minus accusantium beatae vero omnis aliquid eum ex perspiciatis, assumenda voluptatibus fugit delectus sed est molestiae deleniti iste. Repellat nihil in qui culpa consectetur molestiae illum totam distinctio alias porro voluptates consequatur tenetur vitae inventore quia quod, non voluptatum, earum ipsam ipsum praesentium corporis exercitationem? Accusantium, sed odio in necessitatibus voluptates libero ratione praesentium dolore facilis minus hic, earum magni dicta suscipit cum dignissimos error voluptate ipsam delectus debitis assumenda inventore. Quo consequatur iusto sapiente ducimus. Repudiandae quod cum autem quae maxime asperiores omnis in iusto cupiditate voluptatem vel, similique odio officia nihil ex blanditiis modi ratione aut itaque quo perspiciatis nemo aliquid quidem amet. Aspernatur, minima, maxime odio explicabo dicta aliquid dolorem sint facere illo quia officiis vitae consequatur deserunt sit voluptas accusamus id, numquam eius reprehenderit similique! Fuga consectetur dolor nemo, temporibus amet ullam ad ut illum placeat suscipit voluptas impedit commodi nobis nihil eius repellendus quam dolorem voluptatum! Quas unde sapiente facere? Illum culpa voluptate numquam eum suscipit ducimus. Optio numquam, nesciunt sunt vero officiis dolor rem sint itaque expedita consequatur obcaecati quisquam commodi ipsa impedit perferendis labore. Facilis fugit odit voluptatem veritatis, sunt laboriosam tempora vitae molestiae architecto sint at optio eligendi odio perspiciatis adipisci alias cumque facere eveniet inventore nam tenetur exercitationem neque quod. Quaerat, laudantium ducimus? Qui exercitationem libero aut earum. Autem, maiores quia odit veritatis, quaerat voluptates culpa nulla similique eum ullam corrupti mollitia voluptas quasi dolor provident consequuntur quam libero fugiat doloremque consectetur voluptatem cum officiis ipsam? Hic rerum corporis accusamus aut illo sequi tempora maxime nesciunt nisi minima odio dolorum aliquam nemo corrupti ex quis illum saepe, facere, exercitationem cum earum eligendi similique. Laudantium placeat necessitatibus, molestias sapiente voluptates eligendi officiis doloribus repudiandae nemo quasi! Aspernatur ad dolorem repudiandae recusandae laudantium omnis fugit? Quibusdam officiis at, et beatae omnis eligendi nemo. Repellat minus quasi ipsum dolorum nisi natus, quibusdam officiis labore ut doloremque atque quia voluptatum. Aut, blanditiis odio! Harum reiciendis omnis sint hic sit quis, expedita nulla sunt ullam delectus aut repellendus suscipit minus quae autem repudiandae sapiente illo placeat. Consectetur, voluptate amet? Ipsum, amet atque. Debitis vel accusamus sit natus distinctio quaerat placeat consequuntur voluptatum error mollitia maxime saepe totam incidunt, expedita odio culpa. Quos eveniet obcaecati sit excepturi corporis, natus blanditiis quis magni voluptatem impedit neque, esse sed amet asperiores deserunt distinctio nihil nisi error ex saepe! Mollitia iure, blanditiis voluptatum quidem sequi neque placeat cum repudiandae laboriosam amet cupiditate culpa pariatur quam. Quidem consectetur doloremque error ea dolorum veritatis sit laborum eum maxime veniam consequuntur perspiciatis id nobis, velit reiciendis temporibus? Consequatur tempore quis natus quibusdam saepe omnis porro ipsam quasi quia debitis! Qui esse quis recusandae consequuntur dolorem perferendis eum, officia quasi modi animi aspernatur mollitia dolores, vel quisquam, eius eveniet praesentium! Dignissimos ducimus excepturi harum soluta ullam adipisci nihil corporis a illum in possimus quibusdam cum, quasi facere veniam placeat neque laborum libero aperiam quam? Est expedita eum quod distinctio.</p>
            <!-- 텍스트 에디터 저장된 html 코드 -->
        </div>
        <div>
            <a href="/iag/ea/signuplist">목록으로</a>
        </div>
      </div>
    </div>
  </div>

  <%@ include file="/WEB-INF/views/common/footer.jsp" %>
<!-- Icons library -->
<script src="${pageContext.request.contextPath}/resources/plugins/feather.min.js"></script>

<!-- Custom scripts -->
<script src="${pageContext.request.contextPath}/resources/js/script.js"></script>

</body>
</html>