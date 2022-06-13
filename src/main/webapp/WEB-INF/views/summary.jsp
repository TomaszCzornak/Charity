<%--
  Created by IntelliJ IDEA.
  User: tomek
  Date: 13.06.2022
  Time: 09:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <meta http-equiv="X-UA-Compatible" content="ie=edge"/>
    <title>Document</title>

    <link rel="stylesheet" href="<c:url value="/resources/css/style.css"/>"/>
</head>
<body>
<!-- STEP 6 -->
<%--@elvariable id="donation" type="pl.coderslab.charity.model.Donation"--%>

<div data-step="5">
    <h3>Podsumowanie Twojej darowizny</h3>
    <form action="/summary" method="post">

    <div class="summary">
        <div class="form-section">
            <h4>Oddajesz:</h4>
            <ul>
                <li>
                    <span class="icon icon-bag"></span>
                    <span class="summary--text"
                    >${summary.quantity} </span>
                </li>

                <li>
                    <span class="icon icon-hand"></span>
                    <span class="summary--text"
                    >${summary.institution}</span
                    >
                </li>
            </ul>
        </div>

        <div class="form-section form-section--columns">
            <div class="form-section--column">
                <h4>Adres odbioru:</h4>
                <ul>
                    <li>${summary.street}</li>
                    <li>${summary.city}</li>
                    <li>${summary.postcode}</li>
                    <li>${summary.phone}</li>
                </ul>
            </div>

            <div class="form-section--column">
                <h4>Termin odbioru:</h4>
                <ul>
                    <li>13/12/2018</li>
                    <li>15:40</li>
                    <li>Brak uwag</li>
                </ul>
            </div>
        </div>
    </div>
    <div class="form-group form-group--buttons">
        <button type="button" class="btn prev-step">Wstecz</button>
        <button type="submit" class="btn">Potwierdzam</button>
    </div>
</body>
</html>
