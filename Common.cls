public class Common {

    public List<String> commonElList(List<String> ls1, List<String> ls2){
        List<String> commonElement = new List<String>{};
        for(String s : ls1) {
            if(ls2.contains(s)){
                commonElement.add(s);
            }
        }
        return commonElement;
    }

    public List<Integer> fb () {
        Integer value = 0;
        List<Integer> sequence = new List<Integer>{};
        for(Integer i = 0; i <= 9; i++) {
            if(i == 0) {
                sequence.add(0);
                sequence.add(1);
            }
 			sequence.add(sequence.get(i) + sequence.get(i + 1));
        }
        return sequence;
    }

    public void triangle() {
        for(Integer i = 0; i < this.fb().size(); i ++) {
            String s = '';
            for(Integer j = 0; j < i; j ++) {
                s += this.fb().get(j);
            }
            if(String.isNotEmpty(s)) {
                System.debug(s.trim());
            }
        }
    }


}