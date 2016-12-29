# Fuzz

(W.I.P) The readme below specifies the hopeful end result.

An endpoint fuzzer to help discover validation errors

## Requirements

You'll need racket 6.x for this to work,
the easiest way, is to add the up-to-date racket ppa and install it from there.

```
sudo add-apt-repository ppa:plt/racket
sudo apt-get update
sudo apt-get install racket
```

## Sample call

`fuzz http://myendpoint.com?person=/string/&age=/int/`

This will dynamically replace all instances of `/string/` and `/int/` with an input from the `sets/strings` and `sets/numbers` file.

Doing so will create weird inputs that you probably hadn't accounted for in your code. I.e.

```
fuzz http://myendpoint.com?person=/string/&age=/int/
```

Will invoke curl requests against url's such as

```
http://myendpoint.com?person=##{}{}{}}~##&age=9999999999999999999
http://myendpoint.com?person=&age=
http://myendpoint.com?person=&age=00002
etc...
```

and bring back the result of each request.
Then, you can visually scan (or be a grep guru) for errors.

## Configuration and Curl

The config file supplied (curl.conf) is a standard curl configuration file.
In here, you'll need to add your own headers and whatever else in order to authenticate with your service (assuming it needs authentication).

For more information `man curl` and look for the `--config` or `-K` option.

## Tests

To run the tests
```
cd tests
racket test.rkt
```

## Resources

If you don't have a service to try out but just want to try fuzz then the pokemon api is a good choice.

Clone fuzz and run

`racket main.rkt http://pokeapi.co/api/v2/pokemon//int//`

