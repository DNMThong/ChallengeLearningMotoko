import HashMap "mo:base/HashMap";
import Array "mo:base/Array";
import Iter "mo:base/Iter";
import Principal "mo:base/Principal";

actor {
    stable var entries : [(Principal,Nat)] = [];

    // challenge 12
   let favoriteNumber = HashMap.fromIter<Principal,Nat>(Iter.fromArray<(Principal,Nat)>(entries),0,Principal.equal,Principal.hash);

   // challenge 13
//    public shared({caller}) func add_favorite_number(n : Nat) : async (){
//        favoriteNumber.put(caller,n);
//    };

   public shared({caller}) func show_favorite_number() : async ?Nat {
       return favoriteNumber.get(caller);
   };

    // challenge 14
    public shared({caller}) func add_favorite_number(n : Nat) : async Text{
       if(favoriteNumber.get(caller) == null) {
           favoriteNumber.put(caller,n);
           return ("You've successfully registered your number");
       };
       return ("You've already registered your number");
    };

    // challenge 15

    public shared({caller}) func update_favorite_number(n:Nat) : async () {
        let a = favoriteNumber.replace(caller,n);
    };

    public shared({caller}) func delete() : async () {
        favoriteNumber.delete(caller);
    };

    system func preupgrade() {
        entries := Iter.toArray(favoriteNumber.entries());
    }; 
}