
# function that traverses the list and prints out the key-value pairs stored in it

function traverses(list::Nullable{LList})
    if isnull(list) ==true
        println(Nullable{KVPair})
    else
        println(get(list).data)
        traverses(get(list).next)
    end
end

# function search(list::Nullable{LList}, k::Int64) that searches an LList for the key k and returns the corresponding KVPair if it is present and a Nullable{KVPair} otherwise. 

function search(list::Nullable{LList},k::Int64)
    if isnull(list) ==true
        return Nullable{KVPair}
    end
    
    if get(list).data.key == k
       return get(list).data.key , get(list).data.value
    else
       search(get(list).next,k)
    end
end

#takes the LList containing the list of partial sums and a random Float64 in the range [0,xn] as inputs and returns the KVPair corresponding to the interval in which x lies.

function intervalmembership(list::Nullable{LList},x::Float64)
    
    if isnull(list) == true
        return get(list).data.key , get(list).data.value
        
    elseif x < get(list).data.value
        return get(list).data.key , get(list).data.value
        
    else
       intervalmembership(get(list).next,x)
    end
end

#takes the FTree containing the list of partial sums and a random Float64 in the range [0,xn] as inputs and returns the KVPair corresponding to the interval in which x lies

function intervalmembershipFT(FT::Nullable{FTree}, x::Float64)
    if isnull(get(FT).left)==true & isnull(get(FT).right)==true
        return get(FT).data
    elseif x < get(get(FT).left).data.value    
        intervalmembershipFT(get(FT).left,x)
    else
        intervalmembershipFT(get(FT).right, x - get(get(FT).left).data.value)    
    end
end

#analytical solution for thrid exercise
function exponential(x,D,t)
    return (e^(-sqrt(2/(D*t))*abs(x)))/sqrt(2*D*t)
end



