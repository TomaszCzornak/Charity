<%--
  Created by IntelliJ IDEA.
  User: tomek
  Date: 12.06.2022
  Time: 12:50
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
    <head>
        <meta charset="UTF-8"/>
        <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
        <meta http-equiv="X-UA-Compatible" content="ie=edge"/>
        <title>Document</title>
        <link rel="stylesheet" href="/resources/css/style.css"/>
    </head>
</head>
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
            <li><a href="index.jsp" class="btn btn--without-border active">Start</a></li>
            <li><a href="index.jsp#steps" class="btn btn--without-border">O co chodzi?</a></li>
            <li><a href="index.jsp#about-us" class="btn btn--without-border">O nas</a></li>
            <li><a href="index.jsp#help" class="btn btn--without-border">Fundacje i organizacje</a></li>
            <li><a href="index.jsp#contact" class="btn btn--without-border">Kontakt</a></li>
        </ul>
    </nav>

    <div class="slogan container container--90">
        <div class="slogan--item">
            <h1>
                Oddaj rzeczy, których już nie chcesz<br/>
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

<section class="form--steps">
    <div class="form--steps-instructions">
        <div class="form--steps-container">
            <h3>Ważne!</h3>
            <p data-step="1" class="active">
                Uzupełnij szczegóły dotyczące Twoich rzeczy. Dzięki temu będziemy
                wiedzieć komu najlepiej je przekazać.
            </p>
            <p data-step="2">
                Uzupełnij szczegóły dotyczące Twoich rzeczy. Dzięki temu będziemy
                wiedzieć komu najlepiej je przekazać.
            </p>
            <p data-step="3">
                Wybierz jedną, do
                której trafi Twoja przesyłka.
            </p>
            <p data-step="4">Podaj adres oraz termin odbioru rzeczy.</p>
        </div>
    </div>

    <div class="form--steps-container">
        <div class="form--steps-counter">Krok <span>1</span>/4</div>
        <%--@elvariable id="donation" type="pl.coderslab.charity.model.Donation"--%>

        <form:form modelAttribute="donation" method="post">
            <!-- STEP 1: class .active is switching steps -->
            <div data-step="1" class="active">
                <h3>Zaznacz co chcesz oddać:</h3>
                <c:forEach var="item" items="${categories}">
                    <div class="form-group form-group--checkbox">
                        <label>
                            <input
                                    type="checkbox"
                                    name="categories"
                                    value="${item.id}"
                            />
                            <span class="checkbox"></span>
                            <span class="description">${item.name}</span
                            >
                        </label>
                    </div>

                </c:forEach>
                <div class="form-group form-group--buttons">
                    <button type="button" class="btn next-step">Dalej</button>
                </div>
            </div>


            <!-- STEP 2 -->
            <%--@elvariable id="donation" type="pl.coderslab.charity.model.Donation"--%>

            <div data-step="2">
                <h3>Podaj liczbę 60l worków, w które spakowałeś/aś rzeczy:</h3>

                <div class="form-group form-group--inline">
                    <label>
                        Liczba 60l worków:
                        <input type="number" name="quantity" step="1" min="1"/>
                    </label>
                </div>

                <div class="form-group form-group--buttons">
                    <button type="button" class="btn prev-step">Wstecz</button>
                    <button type="button" class="btn next-step">Dalej</button>
                </div>
            </div>

            <%--            STEP4--%>
            <%--@elvariable id="institution" type="pl.coderslab.charity.model.Institution"--%>

            <div data-step="3">
                <h3>Wybierz organizacje, której chcesz pomóc:</h3>
                <c:forEach items="${listOfInst}" var="i" varStatus="status">

                    <div class="form-group form-group--checkbox">
                        <label>
                            <input type="radio" name="institution" value="${i.id}"/>
                            <span class="checkbox radio"></span>
                            <span class="description">

    <div class="title"><c:out value="${i.name}"></c:out></div>
    <div class="subtitle">
    <c:out value="${i.description}"></c:out>

    </div>
    </span>

                        </label>
                    </div>
                </c:forEach>
                <div class="form-group form-group--buttons">
                    <button type="button" class="btn prev-step">Wstecz</button>
                    <button type="button" class="btn next-step">Dalej</button>
                </div>
            </div>


            <!-- STEP 5 -->
            <%--@elvariable id="donation" type="pl.coderslab.charity.model.Donation"--%>

            <div data-step="4">
                <h3>Podaj adres oraz termin odbioru rzecz przez kuriera:</h3>

                <div class="form-section form-section--columns">
                    <div class="form-section--column">
                        <h4>Adres odbioru</h4>
                        <div class="form-group form-group--inline">
                            <label> Ulica <input type="text" name="street" /> </label>
                        </div>

                        <div class="form-group form-group--inline">
                            <label> Miasto <input type="text" name="city" /> </label>
                            </label>
                        </div>

                        <div class="form-group form-group--inline">
                            <label>
                                Kod pocztowy <input type="text" name="zipCode" />
                            </label>
                        </div>

                        <div class="form-group form-group--inline">
                            <label>
                                Numer telefonu <input type="phone" name="phoneNumber" />
                            </label>
                        </div>
                    </div>

                    <div class="form-section--column">
                        <h4>Termin odbioru</h4>
                        <div class="form-group form-group--inline">
                            <label> Data <input type="date" name="pickUpDate" /> </label>
                        </div>

                        <div class="form-group form-group--inline">
                            <label> Godzina <input type="time" name="pickUpTime" /> </label>
                        </div>

                        <div class="form-group form-group--inline">
                            <label>
                                Uwagi dla kuriera
                                <textarea name="pickUpComment" rows="5"></textarea>
                            </label>
                        </div>
                    </div>
                </div>
            <div class="form-group form-group--buttons">
                <button type="button" class="btn prev-step">Wstecz</button>
                <button type="submit" class="btn">Potwierdzam</button>
            </div>


            </div>
        </form:form>
        <!-- STEP 3 -->

        <%--    STEP 4--%>

    </div>
</section>

<footer>
    <div class="contact">
        <h2>Skontaktuj się z nami</h2>
        <h3>Formularz kontaktowy</h3>
        <form class="form--contact">
            <div class="form-group form-group--50">
                <input type="text" name="name" placeholder="Imię"/>
            </div>
            <div class="form-group form-group--50">
                <input type="text" name="surname" placeholder="Nazwisko"/>
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
            ><img src=" ${pageContext.request.contextPath}/resources/images/icon-facebook.svg"
            /></a>
            <a href="#" class="btn btn--small"
            ><img src="${pageContext.request.contextPath}/resources/images/icon-instagram.svg"
            /></a>
        </div>
    </div>
</footer>

<script src="${pageContext.request.contextPath}/resources/js/app.js"></script>
</body>
</html>
