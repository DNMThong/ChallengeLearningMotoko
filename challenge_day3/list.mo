module {
    public type List<T> = ?(T, List<T>);
    
    // challenge 7
    public func is_null<T>(l : List<T>) : Bool {
        switch (l) {
            case (null) {
                return true;
            };
            case(_) {
                return false;
            };
        };
    };

    // challenge 8
    public func last<T>(l : List<T>) : ?T {
        switch (l) {
            case (null) {
                return null;
            };
            case (?(a,null)) {
                return ?a;
            };
            case (?(_,b)) {
                return last<T>(b);
            };
        };
    };

    // challenge 9
    public func size<T>(l : List<T>) : Nat {
        switch (l) {
            case (null) {
                return 0;
            };
            case (?(_,b)) {
                return size<T>(b) + 1;
            };
        };
    };

    // challenge 10
    public func get<T>(l : List<T>,n : Nat) : ?T {
        switch(l) {
            case (null) {
                return null;
            };
            case (?(a,b)) {
                if(n==0) {
                    return ?a;
                }else {
                    return get<T>(b,n-1);
                }
            };
        };
    };
}