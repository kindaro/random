/(listen|server_name[ \t])/ {
    if ($1 ~ /listen/) 
    {
        split ( $2, LISTEN, /[;:]/ )
        IP=LISTEN[1]
    } 
    
    if ($1 ~ /server_name/ )
    {
        split ( $2, SERVER_NAME, ";" ) 
        NAME=SERVER_NAME[1] 
    } 
    
    if ( NAME && IP )
    {
        if (IP == 80) IP=default_ip

        if ( NAME !~ /localhost/ && 
            IP !~ /^127\./ ) print IP "\t" NAME 
        IP="" 
        NAME="" 
} }
