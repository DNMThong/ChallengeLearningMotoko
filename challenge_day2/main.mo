import Nat8 "mo:base/Nat8";
import Text "mo:base/Text";
import Nat "mo:base/Nat";
import Char "mo:base/Char";
import Prim "mo:prim";
import HashMap "mo:base/HashMap";
import Array "mo:base/Array";
import Iter "mo:base/Iter";
import CustomHOF "customHOF";

actor {
    // challenge 1
    public func nat_to_nat8(n:Nat) : async ?Nat8 {
        if(n < 256) {
            return ?Nat8.fromNat(n);
        };
        return (null);
    };

    // challenge 2
    public func max_number_with_n_bits(n:Nat) : async Nat {
        return (2**n - 1);
    };

    // challenge 3 
    public func decimal_to_bits(n:Nat) : async Text {
        var bits : Text = "";
        var number : Nat = n;
        while(number > 0) {
            bits := (Nat.toText(number % 2) # bits);
            number/=2;
        };
        return bits;
    };

    // challenge 4
    public func capitalize_character(c:Char) : async Char {
        return Prim.charToUpper(c);
    };

    // challenge 5
    public func capitalize_text(t:Text) : async Text {
        return Text.map(t,Prim.charToUpper);
    };

    // challenge 6
    public func is_inside(t:Text,c:Char) : async Bool {
        return Text.contains(t,#char c);
    };

    // challenge 7
    public func trim_whitespace(t:Text) : async Text {
        return Text.trim(t,#char ' ');
    };

    // challenge 8
    public func duplicated_character(t:Text) : async Text {
        let hm = HashMap.HashMap<Text,Bool>(3, Text.equal, Text.hash);
        for(c in t.chars()) {
            let text = Char.toText(c);
            if(hm.get(text) != null) {
                return text;
            };
            hm.put(text,true);
        };
        return (t);
    };

    // challenge 9
    public func size_in_bytes(t:Text) : async Nat32 {
        var size : Nat32 = 0;
        for(c in t.chars()) {
            size += Char.toNat32(c);
        };
        return (size);
    };

    // challenge 10
    public func bubble_sort(arr : [Nat]) : async [Nat] {
        var newArr : [var Nat] = Array.thaw(arr);
        let len = newArr.size();
        for(i in Iter.range(0,len - 2)) {
            for(j in Iter.range(i+1,len - 1)) {
                if(newArr[i] > newArr[j]) {
                    var temp : Nat = newArr[i];
                    newArr[i] := newArr[j];
                    newArr[j] := temp;
                };
            };
        };
        return Array.freeze(newArr);
    };

    // challenge 11
    public func nat_opt_to_nat(n : ?Nat,m: Nat) : async Nat {
        switch(n) {
            case (null) {
                return m;
            };
            case(?t) {
                return t;
            };
        };
    };

    // challenge 12
    public func day_of_the_week(n : Nat) : async ?Text {
        var daysOfTheWeek : [Text] = ["Monday","Tuesday","Wednesday","Thursday","Friday","Saturday","Sunday"];
        if(n > 0 and n < 8) {
            return (? daysOfTheWeek[n-1]);
        }else {
            return (null);
        };
    };

    // challenge 13
    public func populate_array(arr : [?Nat]) : async [Nat] {
        return Array.map<?Nat,Nat>(arr,func (a : ?Nat) : Nat {
            switch (a) {
                case (null) {
                    return (0);
                };
                case (?t) {
                    return t; 
                };
            };
        });
    };

    // challenge 14
    public func sum_of_array (arr : [Nat]) : async Nat {
        return Array.foldLeft<Nat,Nat>(arr,0,Nat.add);
    };

    // challenge 15
    public func squared_array(arr : [Nat]) : async [Nat] {
        return Array.map<Nat,Nat>(arr,func (item : Nat) : Nat {item**2});
    };

    // challenge 16 
    public func increase_by_index(arr : [Nat]) : async [Nat] {
        return Array.mapEntries<Nat,Nat>(arr,Nat.add);
    };

    // use custom higher order function challenge 17
    public func isContainsNumber(arr : [Nat],n : Nat) : async Bool {
        return CustomHOF.contains<Nat>(arr,n,func(a:Nat,b:Nat) {a == b});
    };
}