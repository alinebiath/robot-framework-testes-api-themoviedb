# Automated tests for "TheMovieDb" API with Robot Framework.
- Tests applied to The Movie Db API, available at https://developers.themoviedb.org/3/getting-started/introduction
- It is necessary to register a user and the application according to documentation.
- The application register will generate an api_key, required to perform all API requests.

**Pre-conditions for the tests**
- Get api_key by registering for the API
- Clone the project
- Install Python 2.7.15
- An ASCII editor of your preference (i.e. VSCode, Atom, RIDE, etc)</br></br> 

**Installing required Python libraries** </br> 
With the pre-conditions satisfied, the libraries required to run the tests must be installed. At the terminal, execute the command below:
```sh
Windows
$ pip install -r requirements.txt
```
```sh
Linux / Mac
$ sudo pip install -r requirements.txt
```
This command will perform pip installation of what is required by the Robot Framework specified in the requirements.txt file.</br></br>

**Running Robot Framework tests** </br> 
```sh
$ robot --variable VALID_API_KEY:your_api_key -d output ./test-suites/guest-session.robot
```
For more details on running tests and their options see more: http://robotframework.org/robotframework/latest/RobotFrameworkUserGuide.html#executing-test-cases
