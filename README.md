
# nameit - Automagical Naming of Variables

Naming variables is hard. The nameit package attempts to alleviate the hardship
by providing a coherent, descriptive and standards0based naming scheme that 
automagically names variables as they they are transformed.

The names are created by function and function
sequences (cf. magrittr) that know how there results should be named.

## Example 

    nm_mean <- mean %>% set_namer 
    "retail" %>% name_it(mean)
    
