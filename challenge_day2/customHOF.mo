module {

    // challenge 17
    public func contains<A>(arr : [A], a : A, f : (A,A) -> Bool) : Bool {
        for(i in arr.vals()) {
            if(f(i,a)) {
                return true;
            };
        };
        return false;
    };
}