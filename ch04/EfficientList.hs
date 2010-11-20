-- Calling length is simply wrong here. It costs time!
myDumbExample xs = if length xs > 0
                   then head xs
                   else 'Z'

-- This is effectively efficient.
mySmartExample xs = if not (null xs)
                    then head xs
                    else 'Z'

-- this is as the Romans do
myOtherExample (x:_) = x
myOtherExample [] = 'Z'
