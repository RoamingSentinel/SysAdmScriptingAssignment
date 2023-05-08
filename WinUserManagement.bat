@echo off
:: Greeting the user with a message
echo.
echo ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
echo Welcome to the user management script!
echo ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
echo.
:: Listing the users that are currently available on the machine
echo List of current user available on this machine:
net user
goto y
:: Start of command block that's got the "y" label
:y
:: Printing message for keyboard input
choice /c cr /m "Create a new user or remove an already existing one? "
:: If the input is "c", run the command block that's got the "c" label
if %errorlevel% EQU 1 goto c
:: If the input is "r", run the command block that's got the "r" label

:: Start of command block that's got the "c" label 
:c
:: Keyboard input for the new user's name
    set /p newuser=Please type a name for the new user:
:: Keyboard input for the new user's password
    set /p passw=Please type a password for the new user:
:: Creating a new user with the name and password that was given
    net user "%newuser%" "%passw%" /add
:: Listing the users again in order to validate that the new user has been created succesfully
    net user
:: End of command block that's got the "c" label
    :end 

echo.
:: Running the command block with the "prompt" label
goto prompt
echo.

:: Start of command block that's got the "r" label 
:r
:: Keyboard input asking for the user's name that is to be set for deletion
    set /p deluser=Please type the name of the user you would like to delete:
:: Deleting the user that was given
    net user "%deluser%" /delete
:: :: Listing the users again in order to validate that the user has been deleted succesfully
    net user
:: End of block that's got the "r" label
    :end

echo.
:: Running the command prompt with the "prompt" label
echo.

::Start of command block that's got the "prompt" label
:prompt
:: Keyboard input asking the user if he would like to repeat any actions
choice /c yn /m "Would you like to make any other changes? "
:: If the input is "y", run the command that's got the "y" label
if %errorlevel% EQU 1 goto y
:: If the input is "n", run the command block that's in the parentheses
if %errorlevel% EQU 2 (
:: Goodbye message
    echo.
    echo ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    echo Thanks for using the user management script!
    echo ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
)
pause
