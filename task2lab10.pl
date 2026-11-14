
:- use_module(library(readutil)).

% Dataset
account("aya", "1234").
account("sara", "5678").
account("nora", "abcd").


% Login
login :-
    login_attempts(3).


login_attempts(Attempts) :-

    write('Enter username: '),
    read_line_to_string(user_input, Username),

    write('Enter password: '),
    read_line_to_string(user_input, Password),

    ( account(Username, Password) ->

        writeln('Login Successful')

    ;

        ( Attempts > 1 ->

            writeln('Login Unsuccessful'),
            Remaining is Attempts - 1,
            login_attempts(Remaining)

        ;

            writeln('Sorry, you exceeded the maximum number of attempts, try again later.')

        )
    ).
