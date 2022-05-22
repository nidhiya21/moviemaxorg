"use strict";
$(document).ready(function() {
    var l, e, s, c = null,
        h = function(i, n) {
            var a = "",
                o = "";
            return Object.keys(i).forEach(function(e) {
                var t;
                a += i[e].shortName + ", ", void 0 !== i[e].description && null !== i[e].description && "" !== i[e].description ? (t = i[e].shortName + " - " + i[e].description, -1 === n.text().indexOf(t) && ("" === n.html() ? n.html(t) : n.append(". " + t)), o += i[e].description + ", ") : o += i[e].shortName + ", "
            }), a = a.substring(0, a.lastIndexOf(", ")), o = o.substring(0, o.lastIndexOf(", ")), {
                attributeList: a,
                description: o
            }
        },
        r = function(c, u, e, n, v) {
            var p, a = moment().tz(lang.timezone),
                o = moment().tz(lang.timezone).format("YYYY-MM-DD"),
                s = [];
            null != (p = null !== movieDataByReleaseDate && "release-date" === e ? movieDataByReleaseDate[n] : null !== movieDataBySessionTimes && "session-times" === e ? movieDataBySessionTimes[n] : movieData[n]) && 0 < p.length ? (Object.keys(p).forEach(function(t) {
                var i, e = g(s, p[t]);
                o === n ? (i = [], Object.keys(p[t].times).forEach(function(e) {
                    (a.format("HH:mm") <= moment(p[t].times[e].time, "h:mma").format("HH:mm") || "extra" === p[t].times[e].type) && i.push(p[t].times[e])
                })) : i = p[t].times, 0 < i.length && (i[0]["time-moment"] = moment(i[0].time, "h:mma")), -1 === e && 0 < i.length ? s.push({
                    director: p[t].director,
                    actors: p[t].actors,
                    url: p[t].url,
                    title: p[t].title,
                    endpoint: p[t].endpoint,
                    "release-date": p[t].releaseDate,
                    "release-date-moment": moment(p[t].releaseDate, "YYYY-MM-DD"),
                    duration: p[t].duration,
                    rating: p[t].rating,
                    "image-portrait": p[t]["image-portrait"],
                    "image-landscape": p[t]["image-landscape"],
                    times: i,
                    sessionList: [{
                        date: n,
                        "date-moment": moment(n),
                        times: i
                    }]
                }) : 0 < i.length && s[e].sessionList.push({
                    date: n,
                    "date-moment": moment(n),
                    times: i
                })
            }), null !== (p = s) && "release-date" === e ? p.sort(i) : null !== p && "session-times" === e ? p.sort(f) : p.sort(t), Object.keys(p).forEach(function(e) {
                var t, i, n, a, o, s, r, l, m, d = "";
                t = document.querySelector("#templateMovieTimesByDay").cloneNode(!0), r = p[e].times, l = u, m = "", Object.keys(r).forEach(function(e) {
                    -1 !== document.location.href.indexOf("academy") && -1 !== r[e].bookingLink.indexOf("ticketing.us.veezi.com") && (r[e].bookingLink = r[e].bookingLink.replace("ticketing.us.veezi.com", "ticketing.oz.veezi.com"));
                    var t, i, n, a = "";
                    r[e].isSoldOut && (a = "sold-out"), n = void 0 !== r[e].bookingLink && null !== r[e].bookingLink && "" !== r[e].bookingLink ? '<a href="' + r[e].bookingLink + "\" onclick=\"ga('dTracker.send', 'event', 'booking', 'cinema', '" + moment(r[e].time, ["h:mm A"]).format(lang.locale_time_format) + '\');"><span class="time ' + a + '">' + moment(r[e].time, ["h:mm A"]).format(lang.locale_time_format) + "</span></a>" : '<div class="no-booking-link"><span class="time ' + a + '">' + moment(r[e].time, ["h:mm A"]).format(lang.locale_time_format) + "</span></div>", 0 < r[e].attributes.length ? (t = '<div class="session-container">', t += n, t += '<div class="attributes" data-toggle="tooltip" title="' + (i = h(r[e].attributes, l)).description + '">' + i.attributeList + "</div>", t += "</div>") : t = '<div class="session-container">' + n + "</div>", m += t
                }), n = m, a = p[e].actors && 0 < p[e].actors.length ? "<b>" + lang.starring + "</b> " + p[e].actors : "", o = p[e].director && 0 < p[e].director.length ? "<b>" + lang.directed_by + "</b> " + p[e].director : "", p[e].duration && p[e].duration.trim() !== lang.minutes && "" !== p[e].duration.trim() && (d = p[e].duration), p[e].rating && p[e].rating.trim() !== lang.rated && "" !== p[e].rating.trim() && (0 < d.length ? d += " | " + p[e].rating : d = p[e].rating), s = "/movie/" + p[e].url, v ? (t = '<div class="movie"><div class="movie-times">', t += n, t += "</div></div>", c.html(t)) : "content" in t ? (t.content.querySelector("img.poster-portrait").setAttribute("data-src", p[e]["image-portrait"]), t.content.querySelector("a.poster-portrait-link").setAttribute("href", s), t.content.querySelector("img.poster-landscape").setAttribute("data-src", p[e]["image-landscape"]), t.content.querySelector("a.poster-landscape-link").setAttribute("href", s), t.content.querySelector("a.movie-link").setAttribute("href", s), t.content.querySelector("h2").innerHTML = p[e].title, t.content.querySelector("p.duration-rating").innerHTML = d, t.content.querySelector("div.director").innerHTML = o, t.content.querySelector("div.actors").innerHTML = a, t.content.querySelector("div.movie-times").innerHTML = n, i = document.importNode(t.content, !0), document.querySelector("#movie-list").appendChild(i)) : ((t = $("#templateMovieTimesByDay").clone()).find("img.poster-portrait").attr("data-src", p[e]["image-portrait"]), t.find("a.poster-portrait-link").attr("href", s), t.find("a.poster-landscape-link").addClass("hidden"), t.find("img.poster-landscape").addClass("hidden"), t.find("a.poster-landscape-link-ie").attr("href", s), t.find("a.poster-landscape-link-ie").removeClass("hidden"), t.find("div.poster-landscape").css("background-image", "url(" + p[e]["image-landscape"] + ")"), t.find("a.movie-link").attr("href", s), t.find("h2").html(p[e].title), t.find("p.duration-rating").html(d), t.find("div.director").html(o), t.find("div.actors").html(a), t.find("div.movie-times").append(n), c.append(t.html()))
            }), 0 === p.length && c.append("<h2>" + lang.no_movies_today + "</h2>")) : c.append("<h2>" + lang.no_sessions + "</h2>")
        },
        t = function(e, t) {
            return e.title = e.title.trim(), t.title = t.title.trim(), e.title < t.title ? -1 : e.title > t.title ? 1 : 0
        },
        i = function(e, t) {
            return e.title = e.title.trim(), t.title = t.title.trim(), e["release-date-moment"].isBefore(t["release-date-moment"]) ? 1 : e["release-date-moment"].isAfter(t["release-date-moment"]) ? -1 : e.title < t.title ? -1 : e.title > t.title ? 1 : 0
        },
        f = function(e, t) {
            return e.title = e.title.trim(), t.title = t.title.trim(), e.sessionList[0]["date-moment"].isBefore(t.sessionList[0]["date-moment"]) ? -1 : e.sessionList[0]["date-moment"].isAfter(t.sessionList[0]["date-moment"]) ? 1 : e.sessionList[0].times[0]["time-moment"].isBefore(t.sessionList[0].times[0]["time-moment"]) ? -1 : e.sessionList[0].times[0]["time-moment"].isAfter(t.sessionList[0].times[0]["time-moment"]) ? 1 : e.title < t.title ? -1 : e.title > t.title ? 1 : 0
        },
        g = function(t, i) {
            var n = -1;
            return Object.keys(t).forEach(function(e) {
                t[e].endpoint === i.endpoint && (n = e)
            }), n
        },
        m = function(s, m, e, r) {
            var a, o = [],
                l = moment().tz(lang.timezone),
                d = moment().tz(lang.timezone).format("YYYY-MM-DD");
            null != (a = JSON.parse(JSON.stringify(movieData))) && 0 < Object.keys(a).length ? (null === c && (Object.keys(a).sort().forEach(function(n) {
                d <= n && Object.keys(a[n]).forEach(function(t) {
                    var i, e = g(o, a[n][t]);
                    d === n ? (i = [], Object.keys(a[n][t].times).forEach(function(e) {
                        (l.format("HH:mm") <= moment(a[n][t].times[e].time, "h:mma").format("HH:mm") || "extra" === a[n][t].times[e].type) && i.push(a[n][t].times[e])
                    })) : i = a[n][t].times, 0 < i.length && (i[0]["time-moment"] = moment(i[0].time, "h:mma")), -1 === e && 0 < i.length ? o.push({
                        url: a[n][t].url,
                        title: a[n][t].title,
                        endpoint: a[n][t].endpoint,
                        "release-date": a[n][t].releaseDate,
                        "release-date-moment": moment(a[n][t].releaseDate, "YYYY-MM-DD"),
                        duration: a[n][t].duration,
                        rating: a[n][t].rating,
                        "image-portrait": a[n][t]["image-portrait"],
                        "image-landscape": a[n][t]["image-landscape"],
                        sessionList: [{
                            date: n,
                            "date-moment": moment(n),
                            times: i
                        }]
                    }) : 0 < i.length && o[e].sessionList.push({
                        date: n,
                        "date-moment": moment(n),
                        times: i
                    })
                })
            }), c = o), null !== c && "release-date" === e ? c.sort(i) : null !== c && "session-times" === e ? c.sort(f) : c.sort(t), Object.keys(c).forEach(function(n) {
                var e, t, a, i, o = "";
                e = document.querySelector("#templateMovieTimesByMovie").cloneNode(!0), c[n].duration && c[n].duration.trim() !== lang.minutes && "" !== c[n].duration.trim() && (o = c[n].duration), c[n].rating && c[n].rating.trim() !== lang.rated && "" !== c[n].rating.trim() && (0 < o.length ? o += " | " + c[n].rating : o = c[n].rating), i = "/movie/" + c[n].url, a = "", Object.keys(c[n].sessionList).forEach(function(e) {
                    var s, r, t, i, l;
                    a += (s = c[n].sessionList[e], r = m, t = d, l = "", 0 < s.times.length && (i = s.date === t ? lang.today : moment(s.date).locale(lang.locale).format(lang.locale_date_string), l += '<div class="session-row"><div><span class="day">' + i + "</span></div><div>", Object.keys(s.times).forEach(function(e) {
                        var t, i, n, a = "",
                            o = "";
                        t = 0 < s.times[e].attributes.length ? (a = ' <div class="attributes" data-toggle="tooltip" title="' + (i = h(s.times[e].attributes, r)).description + '">(' + i.attributeList + ")</div>", ' class="has-attributes"') : a = "", s.times[e].isSoldOut && (o = "sold-out"), n = void 0 !== s.times[e].bookingLink && null !== s.times[e].bookingLink && "" !== s.times[e].bookingLink ? '<a href="' + s.times[e].bookingLink + '"' + t + '><span class="time ' + o + '">' + moment(s.times[e].time, ["h:mm A"]).format(lang.locale_time_format) + "</span>" + a + "</a>" : ("" !== t && (t = " has-attributes"), '<div class="no-booking-link' + t + '"><span class="time ' + o + '">' + moment(s.times[e].time, ["h:mm A"]).format(lang.locale_time_format) + "</span>" + a + "</div>"), l += n
                    }), l += "</div></div>"), l)
                }), r ? (e = '<div class="movie layout-by-movie"><div class="movie-times">', e += a, e += "</div></div>", s.html(e)) : "content" in e ? (e.content.querySelector("img.poster-portrait").setAttribute("data-src", c[n]["image-portrait"]), e.content.querySelector("a.poster-portrait-link").setAttribute("href", i), e.content.querySelector("img.poster-landscape").setAttribute("data-src", c[n]["image-landscape"]), e.content.querySelector("a.poster-landscape-link").setAttribute("href", i), e.content.querySelector("div.movie-details a.movie-link").setAttribute("href", i), e.content.querySelector("div.posters a.movie-link").setAttribute("href", i), e.content.querySelector("a.details-page-link").setAttribute("href", i), e.content.querySelector("div.movie-details h2").innerHTML = c[n].title, e.content.querySelector("div.posters h2").innerHTML = c[n].title, e.content.querySelector("div.movie-details p.duration-rating").innerHTML = o, e.content.querySelector("div.posters p.duration-rating").innerHTML = o, e.content.querySelector("div.movie-times").innerHTML = a, t = document.importNode(e.content, !0), s.get(0).appendChild(t)) : ((e = $("#templateMovieTimesByMovie").clone()).find("img.poster-portrait").attr("data-src", c[n]["image-portrait"]), e.find("a.poster-portrait-link").attr("href", i), e.find("a.poster-landscape-link").addClass("hidden"), e.find("img.poster-landscape").addClass("hidden"), e.find("a.poster-landscape-link-ie").attr("href", i), e.find("a.poster-landscape-link-ie").removeClass("hidden"), e.find("div.poster-landscape").css("background-image", "url(" + c[n]["image-landscape"] + ")"), e.find("div.posters a.movie-link").attr("href", i), e.find("div.movie-details a.movie-link").attr("href", i), e.find("a.details-page-link").attr("href", i), e.find("div.posters h2").html(c[n].title), e.find("div.movie-details h2").html(c[n].title), e.find("div.posters p.duration-rating").html(o), e.find("div.movie-details p.duration-rating").html(o), e.find("div.movie-times").append(a), s.append(e.html()))
            })) : s.append("<h2>" + lang.no_sessions + "</h2>")
        },
        n = function(t, i) {
            var n = $("#movie-list"),
                a = $("#session-keys"),
                o = $(window).width();
            null == i && (i = !1), n.fadeOut("fast", function() {
                var e;
                e = $("#order-by").val(), n.html(""), a.html(""), "by-day" === theme ? r(n, a, e, t, i) : "by-movie" === theme && m(n, a, e, i), "" === a.html() || i || (a.prepend(lang.sessions_key), a.show()), ($(document).height() <= $(window).height() && 640 < o || 625 < o && $(document).height() > $(window).height()) && $('[data-toggle="tooltip"]').tooltip({
                    template: '<div class="tooltip" role="tooltip"><div class="tooltip-arrow"><div class="tooltip-arrow-inner"></div></div><div class="tooltip-inner"></div></div>'
                }), n.fadeIn(function(e) {
                    myLazyLoad.update()
                })
            })
        },
        d = function() {
            l.reload(), $("ul.slidee").width() < $("#date-scroller").width() ? $("#next, #prev").hide() : $("#next, #prev").show()
        },
        a = function(e) {
            var t, i, n, a, o = $("#date-scroller ul.slidee"),
                s = [],
                r = "";
            for (l.activate(0), o.html(""), n = "session-times" === (i = $("#order-by").val()) ? movieDataBySessionTimes : "release-date" === i ? movieDataByReleaseDate : movieData, Object.keys(n).forEach(function(e) {
                    s.push(e)
                }), s.sort(), a = 0; a < s.length; a += 1) t = moment(s[a]), r += i = "<li " + (0 === a ? 'class="active"' : "") + '><a class="date-slct" data-date="' + s[a] + '" href="#">' + t.locale(lang.locale).format("ddd") + ' <span class="date">' + t.locale(lang.locale).format("DD") + "</span>" + t.locale(lang.locale).format("MMMM") + "</a></li>";
            o.html(r), d(), void 0 !== e && l.activate(s.indexOf(e))
        },
        o = function() {
            var e, t, i, n = $("div.menu-mobile"),
                a = $("div.menu-mobile nav"),
                o = $("div.menu-mobile nav ul li");
            "none" !== n.css("display") && (e = $(window).height(), t = o.length * o.first().outerHeight() + 43 + 85 + 50, i = n.css("position"), e < t && "absolute" !== i ? (n.css("position", "absolute"), a.css("height", "auto"), n.css("height", $(document).height() - 19)) : t <= e && "fixed" !== i && (n.css("position", "fixed"), a.css("height", "calc(100vh - 43px - 85px)"), n.css("height", "auto")))
        },
        u = function(e, t) {
            var i = $(e).data("date");
          //  ga("dTracker.send", "event", "date-scroller", "click", i), n(i, t)
        },
        v = function(e, t, i, n) {
            e.preventDefault();
            var a = $("a.menu-icon"),
                o = $("div.menu-mobile");
            !0 === t ? a.show() : a.hide(), o.css("left", i), o.css("right", n)
        },
        p = function() {
            if (!$("#movieCalendar").is(":visible")) return !1;
            $("#movieCalendar").datepicker("destroy");
            var e, t, i, n = $("#order-by").val(),
                a = -1,
                o = [];
            e = null !== movieDataByReleaseDate && "release-date" === n ? movieDataByReleaseDate : null !== movieDataBySessionTimes && "session-times" === n ? movieDataBySessionTimes : movieData, Object.keys(e).forEach(function(e) {
                o.push(e)
            }), o.sort(), t = void 0 === (t = o[0]) ? new Date : moment(t).format("YYYY-MM-DD"), i = void 0 === (i = o[o.length - 1]) ? new Date : moment(i).format("YYYY-MM-DD"), $("#movieCalendar").datepicker({
                format: "yyyy-mm-dd",
                defaultViewDate: t,
                autoclose: !0,
                startDate: t,
                endDate: i,
                language: lang.locale,
                beforeShowDay: function(e) {
                    var t = moment(e).format("YYYY-MM-DD");
                    return -1 === o.indexOf(t) ? {
                        enabled: !1
                    } : {
                        enabled: !0,
                        classes: "highlighted"
                    }
                }
            }).on("changeDate", function(e) {
                -1 !== (a = o.indexOf(moment(e.date).format("YYYY-MM-DD"))) && (l.activate(a), l.toCenter(a), u($('#date-scroller ul.slidee li a[data-date="' + moment(e.date).format("YYYY-MM-DD") + '"]'), s))
            })
        };
    s = null !== document.getElementById("details")&& $("#datePicker").hide(), o(), null !== document.getElementById("date-scroller") && (e = {
            horizontal: !0,
            itemNav: "basic",
            activateOn: "click",
            mouseDragging: !0,
            touchDragging: !0,
            startAt: 0,
            speed: 300,
            smart: !0,
            prev: $("#prev"),
            next: $("#next")
        }, l = new Sly($("#date-scroller"), e).init(), a(), n($("#date-scroller ul.slidee li.active a").data("date"), s), $(document.body).on("click", "#date-scroller ul.slidee li a", function(e) {
            e.preventDefault(), u(this, s)
        }), $("#next, #prev").on("click", function() {
            u("#date-scroller ul.slidee li.active a", s)
        }), $("#order-by").on("change", function() {
            a($("#date-scroller ul.slidee li.active a").attr("data-date")), u("#date-scroller ul.slidee li.active a", s), p()
        })), null !== document.getElementById("moviePreviews") && ($(window).width() < 521 && $("#moviePreviews").carousel("pause"), $("#moviePreviews").swiperight(function() {
            $("#moviePreviews").carousel("prev")
        }), $("#moviePreviews").swipeleft(function() {
            $("#moviePreviews").carousel("next")
        })), $(window).resize(function() {
            var e, t, i = $(window).width();
            o(), t = i < 626 && $(document).height() > $(window).height() || $(document).height() <= $(window).height() && i < 641, null !== document.getElementById("moviePreviews") && (e = $("#moviePreviews"), !0 === t ? (e.data("interval", !1), e.carousel("pause")) : (e.data("interval", 5e3), e.carousel("cycle"))), $('[data-toggle="tooltip"]').tooltip({
                template: '<div class="tooltip" role="tooltip"><div class="tooltip-arrow"><div class="tooltip-arrow-inner"></div></div><div class="tooltip-inner"></div></div>'
            }), null !== document.getElementById("date-scroller") && d();
            var n = $("div.fb-page");
            0 < n.length && "262px" !== n.attr("data-width") && "undefined" != typeof FB && "undefined" !== FB && (n.attr("data-width", "262px"), FB.XFBML.parse())
        }), $("a.menu-icon").on("click", function(e) {
            v(e, !1, 0, 0)
        }), $("a.close-menu").on("click", function(e) {
            v(e, !0, "-100%", "100%")
        }), $("div.menu-mobile").on("click", function(e) {
            "a" !== e.target.tagName.toLowerCase() && v(e, !0, "-100%", "100%")
        }), $("div.menu-desktop a.more").on("click", function(e) {
            e.preventDefault(), $("div.menu-desktop nav.sub-menu").toggle()
        }), $("#containerCinemas a.more").on("click", function(e) {
            e.preventDefault(), $("#containerCinemas .containerCinemasMenu").toggle()
        }), $("#show-full-synopsis").on("click", function(e) {
            e.preventDefault(), $("#show-full-synopsis").hide(), $("div.short-synopsis").hide(), $("div.full-synopsis").show()
        }), $("a.theme-selector").on("click", function(e) {
            e.preventDefault(), theme = $(this).data("theme"), "by-day" === theme ? ($("#datePicker").show(), a(), p(), u("#date-scroller ul.slidee li.active a", s)) : "by-movie" === theme && ($("#datePicker").hide(), n(null, s)), $("a.theme-selector").removeClass("active"), $(this).addClass("active")
        }), $("#homepage .print-button").click(function() {
            var n = [],
                e = 0;
            $("#printArea div.movie.layout-by-movie").each(function(e) {
                var t = $(this).find("div.posters > a.poster-portrait-link > img");
                t && n.push(t);
                var i = $(this).find("div.posters > a.poster-landscape-link > img");
                i && n.push(i)
            });
            for (var t = 0; t < n.length; t++) n[t].one("load", function() {
                if (++e >= n.length) return window.print(), !1
            }).attr("src", n[t].attr("data-src"))
        }), "objectFit" in document.documentElement.style == !1 && $("#moviePreviews div.preview").each(function() {
            var e = $(this).find("img");
            $(this).find("div.carousel-image").css("background-image", "url(" + e.prop("src") + ")").removeClass("hidden"), e.addClass("hidden")
        }),
        function() {
            if (void 0 !== movieData && null !== movieData && 0 < $("#printArea").length) {
                var e = $("#printArea"),
                    t = $("#session-keys-print");
                m(e, t, "session-times", s), "" !== t.html() && t.prepend(lang.sessions_key)
            }
        }(), p()
});