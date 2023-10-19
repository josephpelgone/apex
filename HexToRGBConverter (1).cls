public with sharing class HexToRGBConverter {

    public final Integer HEX_CODE_LIMIT = 6;
    public final Integer TO_TIMES = 16;
    public final Map<String, Integer> conversion = new Map<String, Integer>{
        '0' => 0,
        '1' => 1,
        '2' => 2,
        '3' => 3,
        '4' => 4,
        '5' => 5,
        '6' => 6,
        '7' => 7,
        '8' => 8,
        '9' => 9,
        'A' => 10,
        'B' => 11,
        'C' => 12,
        'D' => 13,
        'E' => 14,
        'F' => 15
    };
    public String hexCode;

    public Boolean checkIfValidInput(String input) {
        String myPattern = '/^[A-F0-6]*$/g';
        Pattern pattern = Pattern.compile(myPattern);
        Matcher matcher =  pattern.matcher(input);

        if(!matcher.matches())  {
            return true;
        }

        return false;
    }

    public String setHexCode(String input) {
        if(input.length() != this.HEX_CODE_LIMIT || !this.checkIfValidInput(input) ) {
            return 'Invalid Input';
        }
        this.hexCode = input;
        return 'property set';
    }

    public String execute() {
        List<String> listCharacters = this.hexCode.split('');
        List<Integer> listIntegers = new List<Integer>{};
        for(Integer i = 0; i < listCharacters.size(); i++) {
            if(Math.mod(i, 2) == 0) {
                listIntegers.add(this.conversion.get(listCharacters[i + 1]) + this.conversion.get(listCharacters[i]) * this.TO_TIMES);
            }
        }
        return this.hexCode + ' is equal to ' + String.join(listIntegers, ', ');
    }

}