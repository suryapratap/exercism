Red [
	description: {"Binary Search" exercise solution for exercism platform}
	author: "Surya Pratap" ; you can write your name here, in quotes
]
find: function [
    array [block!] 
    value [integer!]
][
    return find-index array value
]
; --- The Search Function ---
find-index: function [
    array [block!] 
    value [integer!]
] [
    if empty? array [
        cause-error 'User 'message ["value not in array"]
    ]
    
    len: length? array
    mid: to-integer (len + 1 / 2)
    pivot: pick array mid
    
    case [
        value = pivot [return mid]
        
        value < pivot [
            sub: copy/part array (mid - 1)
            return find-index sub value
        ]
        
        value > pivot [
            sub: copy at array (mid + 1)
            
            ; We use 'try' here because the recursive call might now 
            ; throw an error instead of returning -1.
            either error? result: try [find-index sub value] [
                ; Re-throw the error to the parent caller
                do result
            ][
                return mid + result
            ]
        ]
    ]
]
