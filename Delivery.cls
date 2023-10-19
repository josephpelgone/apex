public with sharing class Delivery {

    Integer maxWeight = 0;
    Map<String, Integer> items = new Map<String, Integer>{};
    Map<String, Integer> addedItems = new Map<String, Integer>{};

    public Delivery(Integer maxWeight,  Map<String, Integer> items) {
        this.maxWeight = maxWeight;
        this.items = items;
    }

    public Integer getMaxWeight() {
        return this.maxWeight;
    }

    public Map<String, Integer> getItems() {
        return this.items;
    }

    public Integer sumWeight(Map<String, Integer> items) {
        Integer sum = 0;
        for(String itemName : items.keySet()) {
            sum += items.get(itemName);
        }
        return sum;
    }

    public String execute() {
        Integer localWeight = this.maxWeight;
        for(String itemName : items.keySet()) {
            localWeight -= items.get(itemName);
            if(localWeight >= 1) {
                this.addedItems.put(itemName, items.get(itemName));
            }
        }

        return addedItems.keySet().toString().replace('{', '').replace('}', '') + ' were added to van total weight of ' + this.sumWeight(addedItems);
    }

}