define([
    'ko',
    'uiRegistry'
], function (ko, registry) {
    'use strict';

    return function (Component) {
        return Component.extend({
            isFormVisible: ko.observable(false),
            displayFirstname: ko.observable(''),
            displayLastname: ko.observable(''),
            displayCity: ko.observable(''),
            displayTelephone: ko.observable(''),

            toggleForm: function () {
                this.isFormVisible(!this.isFormVisible());
                this.updateDisplayValues();
            },

            initialize: function () {
                this._super();
                var self = this;

                setTimeout(function() {
                    var fieldset = registry.get('checkout.steps.shipping-step.shippingAddress.shipping-address-fieldset');
                    if (fieldset) {
                        if (fieldset.firstname) {
                            fieldset.firstname.subscribe(function() {
                                self.updateDisplayValues();
                            });
                        }
                        if (fieldset.lastname) {
                            fieldset.lastname.subscribe(function() {
                                self.updateDisplayValues();
                            });
                        }
                        if (fieldset.city) {
                            fieldset.city.subscribe(function() {
                                self.updateDisplayValues();
                            });
                        }
                        if (fieldset.telephone) {
                            fieldset.telephone.subscribe(function() {
                                self.updateDisplayValues();
                            });
                        }
                        self.updateDisplayValues();
                    }
                }, 500);

                return this;
            },

            updateDisplayValues: function() {
                var fieldset = registry.get('checkout.steps.shipping-step.shippingAddress.shipping-address-fieldset');
                if (fieldset && fieldset.elems) {
                    var elemsList = fieldset.elems();
                    if (elemsList && elemsList.length > 9) {
                        this.displayFirstname(elemsList[0].value ? elemsList[0].value() : '');
                        this.displayLastname(elemsList[1].value ? elemsList[1].value() : '');
                        this.displayCity(elemsList[7].value ? elemsList[7].value() : '');
                        this.displayTelephone(elemsList[9].value ? elemsList[9].value() : '');
                    }
                }
            }
        });
    };
});




