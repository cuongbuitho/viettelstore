<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
	<%@ taglib uri="http://www.springframework.org/tags" prefix="s" %>
    <footer>
        <div class="footer__top">
            <div class="footer__containter">
                <div class="register__email">
                    <div class="register__email__content">
                        <div class="register__email__text">
                            <label for="" class="email__title"><s:message code="lo.index.REGISTER" /></label>
                            <div class="email__text"><s:message code="lo.index.Dont" /></div>
                        </div>
                        <div class="form__container">
                            <input type="text" placeholder=" Nhập địa chỉ email của bạn" class="txtEmail">
                            <button class="btnRegister">ĐĂNG KÝ</button>
                        </div>
                        <div class="information__container">
                            <input type="checkbox" name="" id="" class="check__email"><s:message code="lo.index.agree" />

                        </div>
                    </div>

                    <!-- <h2>ĐĂNG KÝ NHẬN TIN KHUYẾN MÃI TỪ VIETTEL STORE</h2>
                    <h3>Đừng bỏ lỡ hàng ngàn sản phẩm và chương trình siêu hấp dẫn</h3> -->
                </div>
                <div class="chinhsach">
                    <ul class="footer__list_item">
                        <li class="footer__items">
                            <p><a href="#"><s:message code="lo.index.Warranty" /></a></p>
                            <p><a href="#"><s:message code="lo.index.Return" /></a></p>
                            <p><a href="#"><s:message code="lo.index.Delivery" /></a></p>
                            <p><a href="#"><s:message code="lo.index.Privacy" /></a></p>
                        </li>
                        <li class="footer__items">
                            <p><a href="#"><s:message code="lo.index.Website" /></a></p>
                            <p><a href="#"><s:message code="lo.index.Nearest" /></a></p>
                            <p><a href="#"><s:message code="lo.index.Specialized" /></a></p>
                            <p><a href="#"><s:message code="lo.index.Find" /></a></p>
                            <p><a href="#"><s:message code="lo.index.Invoice" /></a></p>

                        </li>
                        <li class="footer__items">
                            <div class="tuvan"><s:message code="lo.index.Sales" /> (8h - 22h)
                                <br>
                                1800 8123</div>
                            <div class="chamsoc"><s:message code="lo.index.Customer" /> (8h - 22h)
                                <br>
                                1900 8096</div>
                        </li>
                        <li class="footer__items">
                            <div class="">
                                <a href="#"><img src="https://i.imgur.com/iQxwqfN.png" alt="" style="margin-bottom: -40px; margin-right: 5px;"></a>
                                <a href="#"><img src="https://i.imgur.com/rPlbKpF.png" alt=""></a>
                                <a href="#"><img src="https://i.imgur.com/aAf2dtD.png" alt=""></a>
                                <a href="#"><img src="https://i.imgur.com/CoU70cq.png" alt=""></a>
                            </div>
                            <div class="" style="margin-top: 50px;">
                                <a href="#"><img src="https://i.imgur.com/LLc1ADM.png" alt="" style="width: 167px;margin-bottom:-13px;" ></a>
                                <a href="#"><img src="https://i.imgur.com/rFKTSIW.png" alt=""></a>
                            </div>
                        </li>
                    </ul>
                </div>
                <div class="coppy-right">
                    <s:message code="lo.index.Viettel" />
                </div>
            </div>
        </div>
    </footer>