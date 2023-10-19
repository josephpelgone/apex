public with sharing class DecimalToBinaryAndOctalConverter {

    public final Integer TO_BINARY = 2;
    public final Integer TO_OCTAL = 8;
    public List<Integer> listRemaindersBinary = new List<Integer>{};
    public List<Integer> listRemaindersOctal = new List<Integer>{};

    public String execute(Integer input) {
        return input + ' to Binary is ' + this.toBinary(input) + ' \n ' + input +  ' Octal is ' + this.toOctal(input);
    }

    public String toBinary(Integer input) {
        Integer remainder = Math.mod(input, this.TO_BINARY);
        Integer quotient = input / this.TO_BINARY;
        List<String> revertedValue = new List<String>{};

        this.listRemaindersBinary.add(remainder);

        do {
            this.listRemaindersBinary.add(Math.mod(quotient, this.TO_BINARY));
            quotient /= this.TO_BINARY;
        } while (quotient != 0);

        for(Integer i = this.listRemaindersBinary.size() - 1;  i >= 0 ; i--) {
            String value = String.valueOf(this.listRemaindersBinary[i]);
            revertedValue.add(value);
        }

        return String.join(revertedValue, '');
    }

    public String toOctal(Integer input) {
        Integer remainder = Math.mod(input, this.TO_OCTAL);
        Integer quotient = input / this.TO_OCTAL;
        List<String> revertedValue = new List<String>{};

        this.listRemaindersOctal.add(remainder);

        do {
            this.listRemaindersOctal.add(Math.mod(quotient, this.TO_OCTAL));
            quotient /= this.TO_OCTAL;
        } while (quotient != 0);

        for(Integer i = this.listRemaindersOctal.size() - 1;  i >= 0 ; i--) {
            String value = String.valueOf(this.listRemaindersOctal[i]);
            revertedValue.add(value);
        }

        return String.join(revertedValue, '');
    }
}