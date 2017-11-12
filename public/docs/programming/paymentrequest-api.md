Payment Request API
===

### A preface of this notes

This is notes I wrote when I read [Payment Request API specification documentation](https://www.w3.org/TR/payment-request/) as of November 11, 2017.

# Abstract

> Payment Request API (PR API) specification standardizes an API to allow merchants to utilize one or more payment methods with minimal integration. User agents facilitate the payment flow between merchant and user.

- merchants (i.e. web sites selling physical or digital goods)
- user agents (e.g., browsers)

# Status

[Payment Request API specification document](https://www.w3.org/TR/payment-request/) was published by the Web Payments Working Group as a **Gandidate Recommendation**  and is intended to become a W3C Recommendation.

**After 32 October 2017**, Candidate Recommendation is expected to advance to **Proposed Recommendation**.

# Introduction

User agents (e.g. browsers) act as an intermediary between three parties in a transaction.

- the payee
- the payer
- the payment method provider: (e.g.) credit card service providers

The details of how to fulfill a payment request for a given payment method are handled by [payment handlers](https://www.w3.org/TR/payment-handler/).

**This API also enables web sites to take advantage of more secure payment schemes** (e.g., tokenization and system-level authenticatioon) that are not possible with standard JavaScript libraries.

## Goals

- Allow the user agent to act as intermediary between above three parties.
- Standardize the communicatioon flow between a merchant, user agent, and payment method provider.
- Enable payment method providers to bring more secure payment transaction to the web.

### Out of scopes

- Integrate **directly** with payment processors

# Examples of usage

The developer needs to provide following 3 parameters to the [PaymentRequest](https://www.w3.org/TR/payment-request/#dom-paymentrequest) constructor.

- `methodData: sequence<PaymentMethodData>` represents the payment method that the site supports
  - [PaymentMethodData](https://www.w3.org/TR/payment-request/#dom-paymentmethoddata)
  - [example](https://www.w3.org/TR/payment-request/#the-methoddata-argument)
- `details: PaymentMethodDetailsInit` includes **total cost**, **a list of goods or services** being purchased and **shipping options**.
  - [PaymentMethodDetailsInit](https://www.w3.org/TR/payment-request/#dom-paymentdetailsinit)
  - [example](https://www.w3.org/TR/payment-request/#the-details-argument)
- `options: PaymentOptions` that the site needs to delivery the good or service.
  - [PaymentOptions](https://www.w3.org/TR/payment-request/#dom-paymentoptions)
  - [example](https://www.w3.org/TR/payment-request/#the-options-argument)

0. The user clicks "Buy` button. (initiating a payment process)
0. `PaymentRequest` is constructed.
0. The site display the user via `PaymentRequest#show()`.
0. The user confirms request for payment.
0. The return value of `PaymentRequest#show()` resolves and pass `PaymentResponse` to the handler.
0. The site posts some parts of data of `PaymentResponse` back to a server.
0. Calling `PaymentResponse#complete()` to finish payment interaction for the user agent 

- Registering event handlers of `PaymentRequest`, the site is given an oppotunity to update the payment request in response to user input.
  - e.g. Providing additional shipping options, modifying their cost, removing items that cannot ship

  - [PaymentResponse](https://www.w3.org/TR/payment-request/#dom-paymentresponse)

> Because the simultaneous display of multiple PaymentRequest user interfaces might confuse the user, this specification limits the user agent to displaying one at a time via the show() method.
> It is not possible to show multiple PaymentRequests at the same time within one user agent. If a PaymentRequest is already showing, calling show() —from any Web site— will return a promise rejected with an "AbortError" DOMException

# [PaymentRequest Interface](https://www.w3.org/TR/payment-request/#paymentrequest-interface)

## `PaymentRequest#abort()`

- The abort() method is called if a developer wishes to tell the user agent to abort the payment request and to tear down any user interface that might be shown. 
- This method can be called between after calling `show()` and before that promise return value is resolved.

## `PaymentRequest#canMakePayment()`

- If the user agent (e.g. browser) supports payment methods supplied to the PaymentRequest constructor, it returns promised true.
- The developer call this method before calling `show()`.

## `PaymentRequest`'s event handlers

- `onshippingaddresschange`
- `onshippingoptionchange`

## Lifecyle of the `PaymentRequest`

- See state transition figure on [Internal Slots](https://www.w3.org/TR/payment-request/#internal-slots) chapter.

# [PaymentMethodData](https://www.w3.org/TR/payment-request/#paymentmethoddata-dictionary)

- `PaymentMethodData#supportttedMethods`'s candidates is registered at [Registry of standardized payment methods](https://www.w3.org/TR/payment-method-id/#registry).
  > The value of supportedMethods was changed from array to string, but the name was left as a plural to maintain compatibility with existing content on the Web.
  - `basic-card`: The [Basic Card Payment](https://www.w3.org/TR/payment-method-basic-card/)

# [PaymentCurrencyAmount](https://www.w3.org/TR/payment-request/#paymentcurrencyamount)

- One of members **`currencySystem` is at risk of being removed**.

# [Payment details dictionaries](https://www.w3.org/TR/payment-request/#payment-details-dictionaries)

- `displayItems` member
  - Items that the user agent may display.

  > It is the developer's responsibility to verify that the total amount is the sum of these items.

- `shippingOptions` member
  - Shipping options for the user to choose from.

  > Authors should not set selected to true on more than one item. If more than one item in the sequence has selected set to true, then the user agent selects the last one in the sequence.

- `modifiers` member
  - This member enables the developer to adjust the total amount based on payment method.

## [PaymentDetailsInit dictionary](https://www.w3.org/TR/payment-request/#paymentdetailsinit-dictionary)

- `id` member
  - A free form identifiers for this payment request.
  - If empty, the user agent will generate a unique id using UUID.
- `total` member
  - A non negative total amount for the payment request.

## [PaymentDetailsUpdate dictionary](https://www.w3.org/TR/payment-request/#paymentdetailsupdate-dictionary)

- `error` member
  - This can be used to explain following
    - why goods cannot be shipped
    - why no shipping options are available
- `total` member
  - non-negative amount.

# [PaymentDetailsModifier dictionary](https://www.w3.org/TR/payment-request/#paymentdetailsmodifier-dictionary)

This enables the developer to modify the `PaymentDetailsBase` data based on payment method identifier (selected by the user).

# [PaymentShippingType enum](https://www.w3.org/TR/payment-request/#paymentshippingtype-enum)

- `shipping`: default
- `delivery`
- `pickup`: e.g. This could be the address for laundry pickup.

# [PaymentOptions dictionary](https://www.w3.org/TR/payment-request/#paymentoptions-dictionary)

This provides information about the options desired for the payment request. (This is passed through PaymentRequest constructor.)

# [PaymentItem dictionary](https://www.w3.org/TR/payment-request/#paymentitem-dictionary)

This is used to indicate what the payment request is for and the value asked for.

# [PaymentAddress interface](https://www.w3.org/TR/payment-request/#paymentaddress-interface)

This contains an `organization` member, so PaymentRequest API may be used for B2B.

# [PaymentShippingOption](https://www.w3.org/TR/payment-request/#paymentshippingoption-dictionary)

Developers can provide the user with one or more shipping options by calling the `updateWith()` method in change event handlers.

# [PaymentComplete enum](https://www.w3.org/TR/payment-request/#paymentcomplete-enum)

- fail
- success
- unknown

# [PaymentResponse interface](https://www.w3.org/TR/payment-request/#paymentresponse-interface)

> A PaymentResponse is returned when a user has selected a payment method and approved a payment request.

- `methodName` attribute: The payment method identifier for the payment method that the user selected.
- `details` attribute: An object **generated by a payment method that a merchant can use to process or validate a transaction**.
  - Depending on the payment method.
- `shippingAddress` attribute
- `shippingOption` attribute
- `payerName` attribute
- `paymerEmail` attribute
- `payerPhone` attribute
- `requestId` attribute: The corresponding payment request id that spawned this payment response.
- `complete()` method
  - This method can be called after the user has accepted the payment request and the acceptedPromise has been resolved.
  - Calling this method tells the user agent that the payment interaction is over.

# [PaymentRequest and iframe elements](https://www.w3.org/TR/payment-request/#paymentrequest-and-iframe-elements)

> To indicate that a cross-origin iframe is allowed to invoke the payment request API, the allowpaymentrequest attribute can be specified on the iframe element.

# Events

# Algorithms

# [Security Considerations](https://www.w3.org/TR/payment-request/#security-considerations)

- The PaymentRequest API does **not directly support encryption of data fields**.
- Individual payment methods may choose to include support encrypted data but it is **not mandatory** that all payment methods support this.

# [Privacy Considerations](https://www.w3.org/TR/payment-request/#privacy-considerations)

- The user agent **must not share** information about the user with a developer **without user consent**.

