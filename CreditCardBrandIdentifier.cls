public with sharing class CreditCardBrandIdentifier {

    public final Integer VISA_MASTERCARD_CARD_NO_LIMIT = 16;
    public final Integer AMEX_CARD_NO_LIMIT = 15;
    public final String VISA = 'Visa';
    public final String MASTERCARD = 'MASTERCARD';
    public final String AMEX = 'AMEX';
    String creditCardNumber;

    public String getCreditCardType(String creditCardNumber) {

        String type;

        if(creditCardNumber.length() == this.VISA_MASTERCARD_CARD_NO_LIMIT) {
            if(creditCardNumber.startsWith('4')) {
                type = this.VISA;
            }
            if(creditCardNumber.startsWith('5')) {
                type = this.MASTERCARD;
            }
            this.creditCardNumber = creditCardNumber;
        }

        if(creditCardNumber.length() == this.AMEX_CARD_NO_LIMIT) {
            type = this.AMEX;
            this.creditCardNumber = creditCardNumber;
        }

        if(String.isEmpty(type)) {
            type = 'credit card type is invalid';
        }

        return type;
    }

    public String getCreditCardNumber() {

        List<String> splitNumber =  this.creditCardNumber.split('');
        List<Integer> listIntegers = new List<Integer>{};

        for(Integer i = 0; i < splitNumber.size(); i++) {
            if(Math.mod(i, 2) != 0) {
                String product = String.valueOf(Integer.valueOf(splitNumber[i]) * 2);
                Integer value;
                if(product.length() == 2) {
                    value = Integer.valueOf(String.valueOf(Integer.valueOf(splitNumber[i]) * 2)) - 9;
                } else {
                    value =  Integer.valueOf(String.valueOf(Integer.valueOf(splitNumber[i]) * 2));
                }
                listIntegers.add(value);
            } else {
                listIntegers.add(Integer.valueOf(splitNumber[i]));
            }
        }
        return String.join(listIntegers, '');
    }
}