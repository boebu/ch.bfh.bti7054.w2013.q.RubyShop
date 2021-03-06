/**
 * Created by boebu on 12/16/13.
 * This represents the shopping cart
 */

function addToCart(itemid) {
    if ($.cookie("shopping-cart") === null) {
        $.cookie("shopping-cart", itemid);
    } else {
        cookie = $.cookie("shopping-cart");
        items = cookie.split(",");
        items.push(itemid);
        $.cookie("shopping-cart", items.join(","));
    }
    displayCart();
}

function clearCart() {
    $.cookie("shopping-cart", null);
    displayCart();
}

function removeFromCart(id, all) {
    var items = [],
        found = false;
    $.each($.cookie("shopping-cart").split(","), function (index, item) {
        if (item != id || (!all && found)) {
            items.push(item);
        } else {
            found = true;
        }
    });
    $.cookie("shopping-cart", items.length ? items.join(",") : null);
    displayCart();
}

function displayCart() {
    var items = $.cookie("shopping-cart") === null ? [] : $.cookie("shopping-cart").split(",");
    $.get("/items/cartlist", {itemids: items}, function (data) {
        $("#shoppingcart").html(data);
    });
    if (items.length) {
        $('#cart .cart-buttons').show();
    } else {
        $('#cart .cart-buttons').hide();
    }
}

// init chart on page load
$(function () {
    displayCart();
});

