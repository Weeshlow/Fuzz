# Fuzz

(W.I.P) The readme below specifies the hopeful end result.

An endpoint fuzzer to help discover validation errors

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
