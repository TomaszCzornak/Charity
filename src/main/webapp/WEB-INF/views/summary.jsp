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
<html lang="pl">
<body>
<header class="header--form-page">
    <nav class="container container--70">
        <ul class="nav--actions">
            <li class="logged-user">
                Witaj Agata
                <ul class="dropdown">
                    <li><a href="#">Profil</a></li>
                    <li><a href="#">Moje zbiórki</a></li>
                    <li><a href="#">Wyloguj</a></li>
                </ul>
            </li>
        </ul>

        <ul>
            <li><a href="index.html" class="btn btn--without-border active">Start</a></li>
            <li><a href="index.html#steps" class="btn btn--without-border">O co chodzi?</a></li>
            <li><a href="index.html#about-us" class="btn btn--without-border">O nas</a></li>
            <li><a href="index.html#help" class="btn btn--without-border">Fundacje i organizacje</a></li>
            <li><a href="index.html#contact" class="btn btn--without-border">Kontakt</a></li>
        </ul>
    </nav>

    <div class="slogan container container--90">
        <div class="slogan--item">
            <h1>
                Oddaj rzeczy, których już nie chcesz<br />
                <span class="uppercase">potrzebującym</span>
            </h1>

            <div class="slogan--steps">
                <div class="slogan--steps-title">Wystarczą 4 proste kroki:</div>
                <ul class="slogan--steps-boxes">
                    <li>
                        <div><em>1</em><span>Wybierz rzeczy</span></div>
                    </li>
                    <li>
                        <div><em>2</em><span>Spakuj je w worki</span></div>
                    </li>
                    <li>
                        <div><em>3</em><span>Wybierz fundację</span></div>
                    </li>
                    <li>
                        <div><em>4</em><span>Zamów kuriera</span></div>
                    </li>
                </ul>
            </div>
        </div>
    </div>
</header>
<!-- STEP 6 -->
<%--@elvariable id="donation" type="pl.coderslab.charity.model.Donation"--%>
<section class="form--steps">
<form method="post">
    <div style="display: block">
        <h3>Podsumowanie Twojej darowizny</h3>

        <div class="summary">
            <div class="form-section">
                <h4>Oddajesz:</h4>
                <ul>
                    <li>
                        <span class="icon icon-bag"></span>
                        <span class="summary--text"
                        >${summary.quantity} worki</span>
                    </li>

                    <li>
                        <span class="icon icon-hand"></span>
                        <span class="summary--text"
                        >${summary.institution.name}</span
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
                        <li>${summary.zipCode}</li>
                        <li>${summary.phoneNumber}</li>
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

    </div>
</form>
</section>

<footer>
    <div class="contact">
        <h2>Skontaktuj się z nami</h2>
        <h3>Formularz kontaktowy</h3>
        <form class="form--contact">
            <div class="form-group form-group--50">
                <input type="text" name="name" placeholder="Imię" />
            </div>
            <div class="form-group form-group--50">
                <input type="text" name="surname" placeholder="Nazwisko" />
            </div>

            <div class="form-group">
            <textarea
                    name="message"
                    placeholder="Wiadomość"
                    rows="1"
            ></textarea>
            </div>

            <button class="btn" type="submit">Wyślij</button>
        </form>
    </div>
    <div class="bottom-line">
        <span class="bottom-line--copy">Copyright &copy; 2018</span>
        <div class="bottom-line--icons">
            <a href="#" class="btn btn--small"
            ><img src="/resources/images/icon-facebook.svg"
            /></a>
            <a href="#" class="btn btn--small"
            ><img src="/resources/images/icon-instagram.svg"
            /></a>
        </div>
    </div>
</footer>

<script src="/resources/js/app.js"></script>
</body>
<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <meta http-equiv="X-UA-Compatible" content="ie=edge"/>
    <title>Document</title>

    <link rel="stylesheet" href="<c:url value="/resources/css/style.css"/>"/>
</head>
</html>
