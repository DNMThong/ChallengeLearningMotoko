import Debug "mo:base/Debug";
import Array "mo:base/Array";
import Iter "mo:base/Iter"

actor {
    var counter : Nat = 0;

    // challenge 1
    public func add(n: Nat,m: Nat) : async Nat {
        return (n+m);
    };
    
    // challenge 2
    public func square(n: Nat) : async Nat {
        return (n*n);
    };

    // challenge 3
    public func days_to_second(n:Nat) : async Nat {
        return (n*24*60*60);
    };

    // challenge 4
    public func increment_counter() : async Nat {
        counter+=1;
        return (counter);
    };

    public func clear_counter() : async () {
        counter:=0;
    };

    // challenge 5
    public func divide(n: Nat,m: Nat) : async Bool {
        return (n%m==0);
    };

    // challenge 6
    public func is_even(n: Nat) : async Bool {
        return (n%2==0);
    };

    // challenge 7 
    public func sum_of_array(numbers : [Nat]) : async Nat {
        var sum: Nat = 0;
        for(number in numbers.vals()) sum+=number;
        return (sum);
    };

    // challenger 8
    public func maximum(numbers: [Nat]) : async Nat {
        var max: Nat = 0;
        for(number in numbers.vals()) 
            if(number > max) max:=number;
        
        return (max);
    };

    // challenge 9 
    public func remove_from_array(array : [Nat],n : Nat) : async [Nat] {
        return (Array.filter(array,func (number: Nat): Bool {number!=n} ));
    };

    // challenge 10
    public func selection_sort(arr : [Nat]) : async [Nat] {
        var array :[var Nat]= Array.thaw(arr);
        for(i in Iter.range(0,array.size()-2)) {
            var indexMin : Nat = i;
            for(j in Iter.range(i+1,array.size()-1)) {
                if(array[indexMin] > array[j]) indexMin := j;
            };
            var temp : Nat = array[indexMin];
            array[indexMin] := array[i];
            array[i] := temp;
        };
        return (Array.freeze(array));
    };

}