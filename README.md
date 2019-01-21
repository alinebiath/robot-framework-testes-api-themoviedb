# Automated tests for "TheMovieDb" API with Robot Framework.
- Tests applied to The Movie Db API, available at https://developers.themoviedb.org/3/getting-started/introduction
- It is necessary to register a user and the application according to documentation.
- The application register will generate an api_key, required to perform all API requests.

### Pre-conditions for the tests
- Get api_key by registering for the API
- Clone the project
- Install Python 2.7.15
- An ASCII editor of your preference (i.e. VSCode, Atom, RIDE, etc)</br>

### Installing required Python libraries
With the pre-conditions satisfied, the libraries required to run the tests must be installed. At the terminal, execute the command below:
```sh
Windows
$ pip install -r requirements.txt
```
```sh
Linux / Mac
$ sudo pip install -r requirements.txt
```
This command will perform pip installation of what is required by the Robot Framework specified in the <i>requirements.txt file</i>.</br>

### Running Robot Framework tests
Execute at the terminal the command below. Note that you must replace the <b>"your_api_key"</b> with the 32-character code provided by the API when you register your application.
```sh
$ robot --variable VALID_API_KEY:<b>your_api_key</b> -d output ./test-suites/guest-session.robot
```
For more details on running tests in Robot Framework and their options see more: http://robotframework.org/robotframework/latest/RobotFrameworkUserGuide.html#executing-test-cases
