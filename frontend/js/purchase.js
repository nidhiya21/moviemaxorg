$(function () {
    var timer = new Countdown({ container: $(".session-list-cart").find('.countdown'), duration: 300, timeoutUrl: '/Error/CartTimeout?siteToken=y6j4832mam1wt6f1bbv2z1wx88&pageInstanceId=b5c37b953bcf4eed86e86a0588627d25' });
    var args = {
        currencySymbol: '',
        bookingFee: Globalize.parseFloat('1.20'),
        bookingFeePercentage: Globalize.parseFloat('0.00'),
        maximumNumberSession: 20,
        maxBookingFee: Globalize.parseFloat('100,000,000.00'),
        timer: timer,
        showMoreLocalized: 'Show More',
        showLessLocalized: 'Show Less'
        
    };
    new PurchasePage(args);
    if (0 > 0) {
        timer.start();
    }
    ShoppingCartControl(args);
});

function PurchasePage(n) {
    function c() {
        var k, a, y, o, d, b, s, r, c;
        n = n || {
            currencySymbol: "$"
        };
        n.removeOverlay = p;
        n.addOverlay = w;
        u = new ErrorSection;
        u.init();
        t.push({
            constructor: TicketSection
        });
        n.sessionHasAllocatedSeating && t.push({
            constructor: SeatingSection
        });
        n.isShoppingCartTurnedOn ? t.push({
            constructor: CartControl
        }) : t.push({
            constructor: PaymentSection
        });
        k = t[0].instance = new t[0].constructor(n);
        h(k);
        k.navigateTo();
        v();
        a = $(".body-background.film-backdrop");
        y = $(".body-background.film-poster");
        a.attr("src", n.filmBackdropImage);
        y.attr("src", n.filmPosterGraphicImage);
        a.on("load", f);
        y.on("load", f);
        a.on("error", e);
        y.on("error", e);
        for (o = $("#placeHolder").css("background-color"), o && (o = o.replace("rgb(", "rgba("), o = o.replace(")", ",0.16)"), $(".highlight-faded").css("background-color", o)), $("#CustomerEmail").attr("autocomplete", "off"), $("#CustomerEmailConfirmation").attr("autocomplete", "off"), d = $(".poster-container"), b = 0; b < d.length; b++) l($(d[b]).children(".poster-box"));
        $("#display-toggle").click(function() {
            $(".login-section").slideUp();
            $("#MemberForm").removeClass("hidden").slideDown()
        });
        $("#memberPartial .field-validation-error").length > 0 && $("#MemberForm").is(":hidden") && ($(".login-section").slideUp(), $("#MemberForm").removeClass("hidden").slideDown());
        s = $(".synopsis p");
        r = {
            sliceParaSynopsis: "",
            sliceParaImportantInfo: ""
        };
        r.sliceParaSynopsis = $(window).width() < 700 ? i(s, 48, n.showMoreLocalized) : i(s, 107, n.showMoreLocalized);
        c = $("#site-description-section .site-description p");
        r.sliceParaImportantInfo = $(window).width() < 700 ? i(c, 65, n.showMoreLocalized) : i(c, 120, n.showMoreLocalized);
        $(document).on("click", "a.show-more", function(t) {
            t.preventDefault();
            var u = $(this).parent().parent().attr("class"),
                i = $(this).parent();
            u == "synopsis" && $(this).parent().html($(this).parent().html() + r.sliceParaSynopsis);
            u == "site-description" && $(this).parent().html($(this).parent().html() + r.sliceParaImportantInfo);
            i.nextAll().show();
            i.parent().children().last().append('<a href="#" class="show-less">' + n.showLessLocalized + "<\/a>");
            i.children("span").remove();
            i.children("a.show-more").remove()
        });
        $(document).on("click", "a.show-less", function(t) {
            t.preventDefault();
            var u = $(this).parent().parent().attr("class");
            $(this).remove();
            u == "synopsis" && (r.sliceParaSynopsis = "", r.sliceParaSynopsis = $(window).width() < 700 ? i(s, 48, n.showMoreLocalized) : i(s, 107, n.showMoreLocalized));
            u == "site-description" && (r.sliceParaImportantInfo = "", r.sliceParaImportantInfo = $(window).width() < 700 ? i(c, 65, n.showMoreLocalized) : i(c, 120, n.showMoreLocalized))
        })
    }

    function f() {
        $(this).fadeIn("slow")
    }

    function e() {
        $(this).css("display", "none")
    }

    function i(n, t, i) {
        var r = 0,
            e = "",
            f = 0,
            u;
        return n.each(function() {
            var n = $(this).text(),
                o = $(this);
            if (r += n.length, !(r < t)) return r > t && f == 0 && (u = t), r > t && f > 0 && (u = t - (r - n.length)), o.html(n.slice(0, u)), o.append('<span>  ... <\/span><a href="#" class="show-more">' + i + "<\/a>"), o.nextAll().hide(), e = n.slice(u, n.length), f += 1, !1
        }), e
    }

    function l(n) {
        n.length > 1 && setInterval(a, 4e3, n)
    }

    function a(n) {
        for (var i = 0, t = 0; t < n.length; t++)
            if ($(n[t]).is(":visible")) {
                i = t + 1;
                i >= n.length && (i = 0);
                $(n[t]).fadeOut("slow", function() {
                    $(n[i]).fadeIn("slow")
                });
                break
            }
    }

    function v() {
        $("#loyalty-member-section").on("submit", "#MemberForm", function() {
            $("#memberLoginButton").addClass("action-disabled").attr("disabled", "disabled")
        });
        $("#loyalty-member-section").on("submit", "#MemberLogoutForm", function() {
            $("#memberLogoutButton").addClass("action-disabled").attr("disabled", "disabled")
        })
    }

    function o(i) {
        r++;
        var u = t[r].instance = new t[r].constructor(n);
        if (u.wasSkipped = !1, u.showThisSection && !u.showThisSection(i)) {
            o();
            return
        }
        h(u);
        t[r].instance.navigateTo()
    }

    function s() {
        if (r--, t[r].instance.wasSkipped) {
            s();
            return
        }
        t[r].instance.navigateTo()
    }

    function y(n) {
        u.navigateTo(n)
    }

    function h(n) {
        n.onNext.clearListeners();
        n.onBack.clearListeners();
        n.onError.clearListeners();
        n.onNext.subscribe(o);
        n.onBack.subscribe(s);
        n.onError.subscribe(y);
        n.init()
    }

    function p(n) {
        n.css("opacity", "1")
    }

    function w(n) {
        n.css("opacity", "0.3")
    }
    var t = [],
        r = 0,
        u;
    c()
}

function PurchasePageSection() {
    this.init = $.noop;
    this.navigateTo = $.noop;
    this.hide = function() {
        this.element.hide()
    };
    this.onNext = new CustomEvent;
    this.onBack = new CustomEvent;
    this.onError = new CustomEvent;
    this.navigateReady = new CustomEvent
};

function TicketSection(n) {
    function c() {
        if (l()) {
            alert(Language.Ticketing_NumberSessionExceeds);
            return
        }
        i.setEnabled(!1);
        t.addClass("action-disabled").off("click");
        t.hide();
        f(!0);
        a()
    }

    function l() {
        var t = [];
        return t.push(n.sessionCode), $("span[data-sessionid]").each(function() {
            t.push(parseInt($(this).attr("data-sessionid")))
        }), t = t.filter(function(n, t, i) {
            return i.indexOf(n) === t
        }), t.length > n.maximumNumberSession
    }

    function a() {
        var t = v();
        $.ajax({
            type: "POST",
            url: n.selectTicketsUrl,
            dataType: "json",
            async: !0,
            headers: {
                PageInstanceId: n.pageInstanceId
            },
            contentType: "application/json; charset=utf-8",
            traditional: !0,
            data: JSON.stringify(t),
            success: function() {
                r.onNext.fire(t);
                f(!1)
            },
            error: function(n) {
                var i, e, t, u;
                f(!1);
                i = "";
                e = !1;
                try {
                    if (t = JSON.parse(n.responseText), t.errorCode === 2) i = t.message, e = !0;
                    else if (t.message) i = t.message;
                    else if (t.Data)
                        for (i = t.Message, u = 0; u < t.Data.length; u++) i += " " + t.Data[u];
                    else i = "Failed to order tickets. Please refresh the page and try again."
                } catch (o) {
                    i = "Failed to order tickets. Please refresh the page and try again."
                }
                r.onError.fire({
                    message: i,
                    allowRetry: e,
                    parent: r
                })
            },
            timeout: 6e4
        })
    }

    function f(n) {
        u.find("#loading-indicator") && n ? (u.append($('<div id="loading-indicator"><\/div>')), $("html,body").animate({
            scrollTop: $(document).height()
        }, "slow")) : u.find("#loading-indicator").remove()
    }

    function v() {
        var n = [];
        return i.element.find("tbody > tr").each(function(t, i) {
            i = $(i);
            var r = i.find(".quantity input").val();
            r > 0 && n.push({
                code: i.data("code"),
                quantity: i.find(".quantity input").val(),
                loyaltyRecognitionId: i.data("recognitionid"),
                isForAllocatedArea: i.data("isforallocatedarea"),
                cardNumber: i.data("cardnumber"),
                voucherBarcode: i.data("voucherbarcode")
            })
        }), n
    }

    function y(t) {
        var i = b(t),
            r = w(t);
        o.text(Globalize.format(i, "N"));
        e.text(n.currencySymbol + Globalize.format(r + i, "N"));
        p(t)
    }

    function p(n) {
        for (var i in n)
            if (n.hasOwnProperty(i)) {
                t.show();
                return
            } t.hide()
    }

    function w(n) {
        var i = 0;
        for (var t in n) n.hasOwnProperty(t) && n[t].isReward === "False" && (i += n[t].price * n[t].quantity);
        return i
    }

    function b(t) {
        var i = 0,
            s = _.all(t, function(n) {
                return n.bookingFee.toString()
            }),
            u = $(".sub-total .place-holder").attr("data-bookingfee"),
            o = u !== undefined && parseFloat(u) > 0,
            r, f, e;
        for (r in t) t.hasOwnProperty(r) && (f = t[r].bookingFee, (!s || o) && (f = n.bookingFeePercentage > 0 ? t[r].isReward !== "True" ? t[r].price * n.bookingFeePercentage / 100 : 0 : n.bookingFee), i += t[r].quantity * f);
        return i === 0 ? $("#IsBookingFeeTotalZero").val("True") : ($("#IsBookingFeeTotalZero").val("False"), o && (e = n.maxBookingFee - parseFloat(u), i = e > i ? i : e), i > n.maxBookingFee && (i = n.maxBookingFee)), i
    }

    function k(n) {
        var i = $(n.currentTarget),
            t;
        return i.parents("#site-description-section").toggleClass("expanded", 500, "swing").find(".show-description").toggleClass("expanded").find(".expand-text").toggleClass("expanded").text($(".expand-text").is(".expanded") ? Language.SiteDescription_Hide : Language.SiteDescription_Show), t = i.find(".icon"), t.hasClass("icon_chevron_down") ? (t.removeClass("icon_chevron_down"), t.addClass("icon_chevron_up")) : (t.removeClass("icon_chevron_up"), t.addClass("icon_chevron_down")), !1
    }
    var r = this,
        i, t, e, o, u, s, h;
    this.init = function() {
        i = new TicketGrid(n);
        i.ticketsChangedEvent.subscribe(y);
        n.shouldInitialiseCardChecker && (h = new CardSection(n.cardNumberCheckerUrl, n.pageInstanceId, n.siteToken), h.init());
        t = $("#ticket-actions .action.next");
        u = $("#ticket-section");
        e = $("#price-summary .total-value span");
        o = $("#price-summary .booking-fee-value span");
        s = $("#site-description-section");
        s.on("click", ".show-description", k)
    };
    this.navigateTo = function() {
        i.setEnabled(!0);
        i.selectedTicketCount() > 0 && t.show();
        t.removeClass("action-disabled").click(c)
    };
    this.CurrencyRegex = /[^0-9\.\,]*/gi;
    this.formatCurrency = function(n) {
        return Globalize.format(n, "C").replace(r.CurrencyRegex, "").trim()
    }
}
TicketSection.prototype = new PurchasePageSection;
var TicketGrid = function(n) {
    function h() {
        $(".icon_circle_minus").addClass(t);
        s = $("#ticket-actions .next");
        i.element = $("#ticket-table-container table");
        i.element.delegate(".icon_circle_plus", "click", l).delegate(".icon_circle_minus", "click", a).delegate(".login-scroller", "click", v).delegate("input", "blur", c).find("input").each(function() {
            $(this).val(0)
        });
        r = i.element.data("max-quantity")
    }

    function o(n) {
        var t = n.closest("tr"),
            o = e(t),
            f = parseFloat((t.data("price") ? t.data("price").toString() : "0").replace(",", ".")),
            s = t.data("bookingfee"),
            r = parseInt(n.val()),
            h = t.find("span.subtotal-value-money"),
            c = t.find("span.subtotal-value-points"),
            l = t.data("isrewardticket");
        r === 0 ? delete u[o] : u[o] = {
            quantity: r,
            price: f,
            bookingFee: s,
            isReward: l
        };
        h.text(Globalize.format(f * r, "N"));
        c.text(Globalize.format(f * r, "N0"));
        i.ticketsChangedEvent.fire(u)
    }

    function c(n) {
        var u = $(n.target),
            c = u.closest("tr"),
            s = e(c),
            i = Number(u.val()),
            h = $(n.target).parents("tr").data("max-quantity");
        (u.val() === "" || isNaN(i) || i < 0) && u.val(0);
        i !== 0 && ($(n.target).siblings(".icon_circle_minus").removeClass(t), $(n.target).siblings(".icon_circle_plus").removeClass(t));
        i + f(s) < r && $(".icon_circle_plus").removeClass(t);
        i > h && (u.val(h), i = h, $(n.target).siblings(".icon_circle_plus").addClass(t));
        i + f(s) >= r && (i = r - f(s), u.val(i), $(".icon_circle_plus").addClass(t));
        i === 0 && $(n.target).siblings(".icon_circle_minus").addClass(t);
        o(u)
    }

    function l(n) {
        var i = $(n.target).siblings("input"),
            e = parseInt(i.val()),
            s = $(n.target).parents("tr").data("max-quantity"),
            h = f(),
            u = 0;
        h !== r && e !== s && (u = e + 1, i.val(u), $(n.target).siblings(".icon_circle_minus").removeClass(t), u >= s && $(n.target).addClass(t), h + 1 >= r && $(".icon_circle_plus").addClass(t), o(i))
    }

    function a(n) {
        var i = $(n.target).siblings("input"),
            c = f(),
            h = parseInt(i.val()),
            l = $(n.target).parents("tr"),
            a = e(l),
            s;
        if (h === 0) {
            $(n.target).addClass(t);
            return
        }
        s = h - 1;
        i.val(s);
        s === 0 && $(n.target).addClass(t);
        $(n.target).siblings(".icon_circle_plus").removeClass(t);
        c - 1 < r && ($(".icon_circle_plus").removeClass(t), $(".icon_circle_plus").each(function() {
            var n = $(this).parents("tr"),
                i = e(n),
                r = u[i];
            r && r.quantity >= n.data("max-quantity") && a !== i && $(this).addClass(t)
        }));
        o(i)
    }

    function v() {
        $("#MemberForm").is(":hidden") && ($(".login-section").slideUp(), $("#MemberForm").removeClass("hidden").slideDown());
        var n = document.getElementById("member-username-login");
        n && (n.focus({
            preventScroll: !0
        }), n.scrollIntoView({
            behavior: "smooth",
            block: "center",
            inline: "center"
        }))
    }

    function f(n) {
        var t = 0;
        for (var i in u) i !== n && (t += u[i].quantity);
        return t
    }

    function e(n) {
        return n.data("recognitionid") + "-" + n.data("code") + "-" + n.data("cardnumber") + "-" + n.data("voucherbarcode")
    }
    var i = this,
        s, u = {},
        r, n, t = "icon-button--disabled";
    this.element = null;
    this.ticketsChangedEvent = new CustomEvent;
    this.setEnabled = function(t) {
        i.element.find(".icon_circle_plus, .icon_circle_minus").css("visibility", t ? "visible" : "hidden");
        t ? (i.element.find("input").removeAttr("disabled"), n.removeOverlay($("#ticket-section")), $("#ticket-section :input").removeAttr("disabled")) : (i.element.find("input").attr("disabled", "disabled"), n.addOverlay($("#ticket-section")), $("#ticket-section :input").attr("disabled", "disabled"))
    };
    this.CurrencyRegex = /[^0-9\.\,]*/gi;
    this.formatCurrency = function(n) {
        return Globalize.format(n, "C").replace(i.CurrencyRegex, "").trim()
    };
    this.selectedTicketCount = function() {
        return f()
    };
    h()
};
var CardSection = function(n, t, i) {
    function c() {
        var e = $(".card-number").val();
        e && (l(), $.ajax({
            type: "POST",
            url: n,
            data: JSON.stringify({
                siteToken: i,
                cardNumber: e
            }),
            async: !0,
            headers: {
                PageInstanceId: t
            },
            contentType: "application/json; charset=utf-8",
            traditional: !0,
            success: function(n) {
                a();
                n === v ? ($("#MemberForm").length ? ($(h).show("slide", {
                    direction: "left"
                }, 500), $(r).hide("slide", {
                    direction: "right"
                }, 500)) : $(f).show("slide", {
                    direction: "left"
                }, 500), $(u).hide("slide", {
                    direction: "right"
                }, 500)) : n === y ? ($(u).show("slide", {
                    direction: "left"
                }, 500), $(r).show("slide", {
                    direction: "left"
                }, 500), $(f).hide(), $(h).hide()) : ($(f).hide(), $(u).hide("slide", {
                    direction: "right"
                }, 500));
                $("#MemberLoginViewModel_CardTypeToAdd").val(n)
            },
            error: function() {
                a();
                alert("There was an error please refresh the page and try again.")
            },
            timeout: 6e4
        }))
    }

    function l() {
        $(o).show();
        $(s).hide();
        $(r).prop("disabled", !0)
    }

    function a() {
        $(o).hide();
        $(s).show();
        $(r).prop("disabled", !1)
    }
    var e, o = ".loading",
        s = ".add-card-text",
        r = ".add-card-btn",
        u = ".card-number-pin",
        f = ".card-number-lastname",
        h = ".membership-card__login",
        v = "MemberCard",
        y = "VoucherCard";
    this.init = function() {
        var n = 500,
            t;
        e = vista.utils.debounce(c, n);
        $(".card-number").on("input", e);
        $("#MemberCardForm").on("submit", function() {
            var n = $(".card-number").val();
            n && l()
        });
        t = $("#MemberLoginViewModel_AdditionalMemberTicketAdded");
        t.val() === "True" && $([document.documentElement, document.body]).animate({
            scrollTop: $(".card-number").offset().top
        }, n);
        $(".login-scroll-btn").click(function() {
            $([document.documentElement, document.body]).animate({
                scrollTop: $("#MemberForm").offset().top
            }, n);
            $("#MemberForm").is(":hidden") && ($(".login-section").slideUp(), $("#MemberForm").removeClass("hidden").slideDown());
            $("#member-username-login") && $("#member-username-login").focus()
        });
        c()
    }
};

function SeatingSection(n) {
    function f() {
        var n = setTimeout(function() {
            seatingLoaded && (u.start(), t.find(".countdown").show(), $("html,body").animate({
                scrollTop: t.offset().top
            }, "slow"), t.find(".action-secondary-button.back").click(o).removeClass("action-disabled").end().find(".action.next").click(e).removeClass("action-disabled").end(), clearTimeout(n))
        }, 100)
    }

    function e() {
        window.validateSeating() && (u.stop(), t.find(".countdown").hide(), t.find(".action-secondary-button.back, .action.next").addClass("action-disabled").off("click"), t.find(".Seating-Area").off("click"), h())
    }

    function o() {
        r.empty();
        t.hide();
        u.stop();
        s();
        i.onBack.fire()
    }

    function s() {
        $.ajax({
            type: "POST",
            url: n.removeFromCartUrl,
            data: JSON.stringify({
                sessionId: n.sessionCode,
                currentViewingFilm: ""
            }),
            async: !0,
            headers: {
                PageInstanceId: n.pageInstanceId
            },
            contentType: "application/json; charset=utf-8",
            traditional: !0,
            error: function(n) {
                var i = "",
                    t;
                try {
                    t = JSON.parse(n.responseText);
                    t.message ? i = t.message : t.Message && (i = t.Message)
                } catch (r) {
                    i = r
                }
                console.log(i)
            },
            timeout: 6e4
        })
    }

    function h() {
        $.ajax({
            type: "POST",
            url: n.selectSeatsUrl,
            contentType: "application/json; charset=utf-8",
            headers: {
                PageInstanceId: n.pageInstanceId
            },
            traditional: !0,
            data: JSON.stringify({
                seatSelection: $("#seatSelection").val(),
                sessionCode: n.sessionCode
            }),
            success: function() {
                i.onNext.fire();
                c()
            },
            error: function(n) {
                var t = !1,
                    r = "Something went wrong while trying to order your seats. Please refresh the page and try again.";
                n.status == 500 && (n.responseJSON && n.responseJSON.message ? (t = !0, r = n.responseJSON.message) : (t = !0, r = "Something went wrong while trying to order your seats. Please go back and choose new seats."));
                i.onError.fire({
                    message: r,
                    allowRetry: t,
                    parent: i
                })
            },
            timeout: 6e4
        })
    }

    function c() {
        $("#seating-actions").hide();
        n.addOverlay($("#seat-selection"))
    }
    var i = this,
        r, u, n, t;
    this.init = function() {
        t = $("#seat-selection");
        r = t.find(".layout");
        u = new Countdown({
            container: t.find(".countdown"),
            duration: n.timeoutDuration,
            timeoutUrl: n.timeoutUrl
        })
    };
    this.showThisSection = function(t) {
        for (var r = !1, i = 0; i < t.length; i++)
            if ($.inArray(t[i].code.toString(), n.selectableTickets) != -1 && t[i].quantity > 0) {
                r = !0;
                break
            } return this.wasSkipped = !r, r
    };
    this.wasSkipped = !1;
    this.navigateTo = function() {
        $("#seating-actions").show();
        n.removeOverlay($("#seat-selection"));
        t.show();
        t.find(".countdown").hide();
        r.empty().append($('<div id="loading-indicator"><\/div>'));
        $("html,body").animate({
            scrollTop: t.offset().top
        }, "slow");
        t.find(".action-secondary-button.back").addClass("action-disabled").off("click").end().find(".action.next").addClass("action-disabled").off("click").end();
        $.ajax({
            type: "GET",
            cache: !1,
            url: n.loadSeatingUrl,
            headers: {
                PageInstanceId: n.pageInstanceId
            },
            success: function(n) {
                r.html(n);
                f()
            },
            error: function() {
                i.onError.fire({
                    message: "Something went wrong loading the seat layout. Please try again.",
                    allowRetry: !0,
                    parent: i
                })
            },
            timeout: 6e4
        })
    }
}
SeatingSection.prototype = new PurchasePageSection;

function PaymentSection(n) {
    function f() {
        t.hide();
        r();
        u.onBack.fire()
    }

    function e() {
        var r = $("#AcceptTerms");
        if (r.length != 0 && !r.is(":checked")) return $(".item.terms .field-validation-error").remove(), $(".item.terms label").after($('<span class="field-validation-error">' + Language.PersonalDetails_TermConditionRequired + "<\/span>")), $("button#goToPaymentPage").addClass("action-disabled"), $(".checkmark--required").addClass("warning-checkbox"), !1;
        if ($("input#CustomerEmailConfirmation").length > 0 && !$("input#CustomerEmailConfirmation").val()) return $("#emailMismatchValidation").show(), !1;
        if (n.isShoppingCartTurnedOn === "True" && $(".in-basket").length === 0) return alert(Language.Payment_CartEmptyMessage), !1;
        if (t.find("form").valid()) i.stop();
        else return !1;
        return $("input#CustomerEmail").length && $("input#CustomerEmail").val().trim(), $("input#CustomerEmailConfirmation").length && $("input#CustomerEmailConfirmation").val().trim(), s(!0), t.find("form").submit(), $("input#CustomerEmail").attr("disabled", "disabled"), $("input#CustomerEmailConfirmation").attr("disabled", "disabled"), $("input#CustomerFirstName").attr("disabled", "disabled"), $("input#CustomerLastName").attr("disabled", "disabled"), $("input#CaptureEmail").attr("disabled", "disabled"), $("input#CustomerPhoneNumber").attr("disabled", "disabled"), $("select#PaymentConnector").attr("disabled", "disabled"), $("input#AcceptTerms").attr("disabled", "disabled"), $("button#goToPaymentPage").addClass("action-disabled").off("click"), $("#personal-details-actions").find("button.action.back").addClass("action-disabled").off("click"), $("#personal-details-actions.link").length != -1 && ($("#personal-details-actions .link").addClass("action-disabled"), $("#personal-details-actions .link").click(function(n) {
            n.preventDefault()
        })), !1
    }

    function o() {
        var n = !0;
        $("input#CustomerEmailConfirmation").length > 0 && (n = $("input#CustomerEmailConfirmation").val() === $("input#CustomerEmail").val());
        $("#AcceptTerms").is(":checked") && n ? ($(".item.terms .field-validation-error").remove(), $(".checkmark--required").removeClass("warning-checkbox"), $("button#goToPaymentPage").removeClass("action-disabled")) : $("button#goToPaymentPage").addClass("action-disabled")
    }

    function s(n) {
        t.find("#loading-indicator") && n ? (t.append($('<div id="loading-indicator"><\/div>')), $("html,body").animate({
            scrollTop: t.offset().top
        }, "slow")) : t.find("#loading-indicator").remove()
    }

    function h() {
        $("input#CustomerEmailConfirmation").length > 0 && ($('label[for="CustomerEmailConfirmation"]').prepend('<span class="required" aria-required="true">*<\/span>'), $("input#CustomerEmail,input#CustomerEmailConfirmation").focusout(function() {
            $("input#CustomerEmailConfirmation").val() && $("input#CustomerEmail").val() && ($("input#CustomerEmail").val() === $("input#CustomerEmailConfirmation").val() ? ($("button#goToPaymentPage").removeClass("action-disabled"), $("#emailMismatchValidation").hide()) : ($("button#goToPaymentPage").addClass("action-disabled"), $("#emailMismatchValidation").show()));
            $("input#CustomerEmail").length && $("input#CustomerEmail").val($("input#CustomerEmail").val().trim());
            $("input#CustomerEmailConfirmation").length && $("input#CustomerEmailConfirmation").val($("input#CustomerEmailConfirmation").val().trim())
        }))
    }
    var u = this,
        t, i, r;
    this.init = function() {
        t = $("#personal-details-section");
        t.find(".action.back").click(f).end().find(".action.next").click(e).end().find("#AcceptTerms").change(o).end();
        i = new Countdown({
            container: t.find(".countdown"),
            duration: n.timeoutDuration,
            timeoutUrl: n.timeoutUrl
        });
        h()
    };
    r = function() {
        t.find(".action.back").unbind("click");
        t.find(".action.next").unbind("click");
        t.find("#AcceptTerms").unbind("change");
        i.stop()
    };
    this.navigateTo = function() {
        t.show();
        i.start();
        $("html,body").animate({
            scrollTop: t.offset().top
        }, "slow");
        var n = $("#Form");
        n.find(".item.long .field input").each(function() {
            if (this.value.length) return $("#Form").valid(), !1
        });
        t.find("input").first().select()
    }
}
PaymentSection.prototype = new PurchasePageSection;

function ErrorSection() {
    function i() {
        n.hide();
        location.reload()
    }
    var n, t;
    this.init = function() {
        n = $("#error-section");
        n.find(".retry").click(i)
    };
    this.navigateTo = function(i) {
        t = i.parent;
        n.find("p").text(i.message).end().show();
        n.find("#error-actions").toggle(i.allowRetry);
        $("html,body").animate({
            scrollTop: n.offset().top
        }, "slow")
    }
}
ErrorSection.prototype = new PurchasePageSection;

function ShoppingCartControl(n) {
    function e() {
        var n = 50;
        $("header").length > 0 && (n = $("header").height());
        $(".session-list-cart").css("top", n);
        $(window).scroll(function() {
            $(".session-list-cart").css("top", n)
        })
    }

    function r() {
        $("span[data-sessionid].delete-btn").click(function() {
            var n = parseInt($(this).attr("data-sessionid")),
                t = confirm(Language.CartItem_RemoveMessage);
            t === !0 && (n === i ? u(n, f) : u(n, o))
        });
        $("span.place-holder.bin-icon").click(function() {
            var n = parseInt(i);
            isNaN(n) || f()
        })
    }

    function u(i, r) {
        $(".loading-image").show();
        $.ajax({
            type: "POST",
            url: n.removeFromCartUrl,
            data: JSON.stringify({
                sessionId: i,
                currentViewingFilm: t
            }),
            async: !0,
            headers: {
                PageInstanceId: n.pageInstanceId
            },
            contentType: "application/json; charset=utf-8",
            traditional: !0,
            success: r,
            error: function(n) {
                var i = "",
                    t;
                try {
                    t = JSON.parse(n.responseText);
                    t.message ? i = t.message : t.Message && (i = t.Message)
                } catch (r) {
                    i = r
                }
                console.log(i);
                $(".loading-image").hide()
            },
            timeout: 6e4
        })
    }

    function f() {
        var t = window.location.href;
        t = $(".in-basket").length > 0 ? n.orderSummaryPageUrl : n.addShowRedirectionUrl;
        window.location = t
    }

    function o(i) {
        t ? ($(".shopping-cart").replaceWith(i), r(), $(".loading-image").hide()) : window.location = n.addShowRedirectionUrl
    }
    var s = this,
        h = n.removeFromCartUrl,
        t = n.currentViewingFilmTitle,
        i = n.sessionCode;
    this.init = function() {
        e();
        r()
    };
    init()
};

function CartControl(n) {
    function i() {
        $.ajax({
            type: "POST",
            url: n.updateCartUrl,
            async: !0,
            headers: {
                PageInstanceId: n.pageInstanceId
            },
            contentType: "application/json; charset=utf-8",
            traditional: !0,
            success: function(t) {
                $(".shopping-cart").replaceWith(t);
                ShoppingCartControl(n);
                n.timer.restart(600)
            },
            error: function(n) {
                var i = "",
                    t;
                try {
                    t = JSON.parse(n.responseText);
                    t.message ? i = t.message : t.Message && (i = t.Message)
                } catch (r) {
                    i = r
                }
                console.log(i)
            },
            timeout: 6e4
        }).always(function() {
            $(".loading-image").hide()
        })
    }
    var r = this,
        n = n,
        t;
    this.init = function() {
        t = $("#cart-action-controls-section")
    };
    this.navigateTo = function() {
        i();
        t.show();
        $(".loading-image").show();
        this.wasSkipped = !0;
        $("html,body").animate({
            scrollTop: t.offset().top
        }, "slow")
    }
}
CartControl.prototype = new PurchasePageSection;
Countdown = function(n) {
    function c() {
        (t = !0, clearInterval(r), i = $(n.container).find(".time"), i.length) && (t = !1, f = new Date, o = n.timeoutUrl, e = n.duration, r = setInterval(u, s), u())
    }

    function u() {
        var o, n, u, s;
        t || (o = (new Date - f) / 1e3, n = e - o, n < .5 ? (clearInterval(r), setTimeout(l, 10)) : (u = Math.floor(n / 60), s = Math.floor(n - u * 60), i.text(h(u) + ":" + h(s))))
    }

    function l() {
        t || (t = !0, window.location = o)
    }

    function h(n) {
        var i, t;
        for (n = "" + (n || "0"), i = n.length, t = 0; t < 2 - i; t++) n = "0" + n;
        return n
    }
    var f, i, e, o, r, t = !1,
        s = 500;
    this.start = function() {
        (i = $(n.container).find(".time"), i.length) && (t = !1, f = new Date, o = n.timeoutUrl, e = n.duration, r = setInterval(u, s), u())
    };
    this.stop = function() {
        t = !0;
        clearInterval(r)
    };
    this.restart = function(t) {
        n.duration = t;
        c()
    }
}; 
$(document).on("click", ".pay", function () { 
    var movieID = $('#movieID').val();
    var theaterID = $('#theaterID').val();
    var showID = $('#showID').val(); 
    var bookedDate = $('#bookedDate').val();
    var bookedTime = $('#bookedTime').val();
    var userID      = $('#userID').val();
    var goldFullCount = $('#goldFullCount').val();
    var goldHalfCount = $('#goldHalfCount').val();
    var odcFullCount = $('#odcFullCount').val();
    var odcHalfCount = $('#odcHalfCount').val(); 
    var boxCount = $('#boxCount').val();
    var orderAmount = document.getElementById("total").innerText;
    var feeValue = document.getElementById("booking-fee-value").innerText;
    if(feeValue==0.00){
         alert("Please select any seat"); 
    }else{
        $.ajax({
        type:"POST",   
        url: 'components/movies.cfc',  
        async: false,
        dataType: "json",  
        data: {
                method: "insertBooking",
                userID: userID,
                theaterID: theaterID,
                showID: showID, 
                movieID: movieID,
                bookedDate: bookedDate,
                bookedTime: bookedTime,
                goldFullCount: goldFullCount,
                goldHalfCount: goldHalfCount,
                odcFullCount: odcFullCount,
                odcHalfCount: odcHalfCount,
                boxCount: boxCount,
                orderAmount: orderAmount
            },
            success: function(objResponse ){   
                window.location = './seat.cfm';
             
            } 
        }); 
    }
});
