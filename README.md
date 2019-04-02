# Automated tests for "TheMovieDb" API with Robot Framework
- Tests applied to The Movie Db API, available at https://developers.themoviedb.org/3/getting-started/introduction
- Testing access to API as a guest and performing permitted operations and trying to perform non-permitted operations.
- It is necessary to register an user and the application according to documentation. Register: https://www.themoviedb.org/account/signup
- The application register will generate an api_key, required to perform all API requests.

### 1. Structure of tests
The tests are structured in directories as follows:
- **keywords**: contains <i>.robot</i> files with implementation keywords.
- **test-suites**: contains the <i>.robot</i> file with test suites (scenarios or test cases).
- **.gitignore**: ccontains files to be ignored by git.
- **requirements.txt**: file containing the calls for installation of the robot framework and the necessary libraries.</br>

### 2. Pre-conditions for the tests
- Get api_key by registering for the API
- Clone the project
- Install Python 2.7.15
- Use an ASCII editor of your preference (i.e. VSCode, Atom, RIDE, etc)</br>

### 3. Installing required Python libraries
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

### 4. Running Robot Framework tests
Execute at the terminal the command below. Note that you must replace the <b>"your_api_key"</b> with the 32-character code provided by the API when you register your application.
```sh
$ robot --variable VALID_API_KEY:your_api_key -d output ./test-suites/guest-session.robot
```
For more details on running tests in Robot Framework and their options see more: http://robotframework.org/robotframework/latest/RobotFrameworkUserGuide.html#executing-test-cases

### 5. Gererating documentation
- Generate reports of your scenarios or users keywords with Robot.

- The following command generates the documentation of the user keywords in the output directory (or another of your preference):
```sh
$ python -m robot.libdoc keywords/guest-session.robot output/user-keywords-documentation.html
```
- The following command generates the documentation of the scenarios in the output directory (or another of your preference):
```sh
$ python -m robot.testdoc test-suites/guest-session.robot output/test-suite-documentation.html
```

