# V-REX (Short for Vacation Recommendations)

This application utilizes MVC architecture and CRUD design to allow users to view and create posts about vacation recommendations.  It requires that all users of the application create an account in order to access the site.  The application provides validation that only permits users to edit or delete recommendations that they have created. 

## Getting Started

* Clone the repository located [here](https://github.com/SwellPF/V-REX) to your computer.
* Navigate to the directory for V-REX.
* Run rake db:migrate.
* Run bundle install to install the required Ruby gems.
* Run shotgun to spin up a local server.
* Open your browser to localhost:9393.

### Prerequisites

Run bundle install to install all required Ruby gems.

```
bundle install
```

### Running the application using your computer as a local server

In your terminal window, launch shotgun.

```
shotgun
```

Then open your browser to the local server

```
localhost:9393
```

## Built With

* [Sinatra](http://sinatrarb.com/) - The web framework used
* [Sinatra-Flash](https://github.com/SFEley/sinatra-flash) - Error message presentation
* [bcrypt] (https://github.com/codahale/bcrypt-ruby) - Encrypting passwords with a salted hash

## Author

* **Paul A. Cinoman** - *Design and Development* - [Paul Cinoman's GitHub Page](https://github.com/Swellpf)


## License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details

## Acknowledgments

* Thanks to Meg Gutshall for the excellent recommendation to use the Sinatra Flash gem

