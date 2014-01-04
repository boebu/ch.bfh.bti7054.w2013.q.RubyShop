/**
 * Created by boebu on 12/16/13.
 * This represents the shopping cart
 */

function addToCart(itemid) {
    if($.cookie("shopping-cart") === null) {
        $.cookie("shopping-cart", itemid);
    } else {
        cookie = $.cookie("shopping-cart");
        items = cookie.split(",");
        items.push(itemid);
        $.cookie("shopping-cart",items.join(","));
    }
    displayCart();
}

function clearCart() {
    $.cookie("shopping-cart", null);
    displayCart();
}

function displayCart() {
    $("#shoppingcart").html($.cookie("shopping-cart"));
}

