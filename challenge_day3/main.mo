import Custom "custom";
import Animal "animal";
import List "mo:base/List";
import Buffer "mo:base/Buffer";
import Debug "mo:base/Debug";
import Nat "mo:base/Nat";
import l "list";
import Principal "mo:base/Principal";
import HashMap "mo:base/HashMap";
import Cycles "mo:base/ExperimentalCycles";

actor {
    public type Team = Custom.Team;
    public type Animal = Animal.Animal;

    // challenge 1
    public func fun() : async Team {
        let myTeam : Team = {
            name = "Null";
            members = ["Thong","Nghia","Tai","Quan"];
        };
        return myTeam;
    };

    // challenge 2
    let meo : Animal = {
        specie = "cat";
        energy = 50;
    };

   // challenge 4
   public func create_animal_then_takes_a_break(specie : Text,energy : Nat) : async Animal{
       let animal : Animal = {
           specie;
           energy;
       };
       return Animal.animal_sleep(animal);
   };   

   // challenge 5
   public type List<T> = List.List<T>;
   var listAnimal : List<Animal> = List.nil<Animal>();

   // challenge 6
   public func push_animal(animal : Animal) : async () {
       listAnimal := List.push<Animal>(animal,listAnimal);
   };

   public func get_animals() : async [Animal] {
       let bf = Buffer.Buffer<Animal>(1);
       List.iterate(listAnimal,bf.add);
       return bf.toArray();
   };

   // challenge 11
   public shared(msg) func is_anonymous() : async Bool {
       return Principal.isAnonymous(msg.caller); 
   };

   // challenge 12
   let favoriteNumber = HashMap.HashMap<Principal,Nat>(0,Principal.equal,Principal.hash);

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

    // challenge 16
    var owner: ?Principal = null;

    public shared({caller}) func deposit_cycles() : async Nat {
        owner := ?caller;
        return Cycles.accept(Cycles.available());
    };

    // challenge 17
    public func getCyclesCanister() : async Nat{
         return Cycles.balance();
    };

    public shared({caller}) func withdraw_cycles(n : Nat) : async (){
        assert (owner == ?caller);
        let cyclesCanister = await getCyclesCanister();
        assert(cyclesCanister >= n);
        Cycles.add(n);
    };

    // challenge 18
    stable var count : Nat = 0;
    public func increment_counter() : async Nat {
        count+=1;
        return count;
    }

    
}