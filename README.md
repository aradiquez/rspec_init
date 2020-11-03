### Can I see it Working?

you can clone this repo and then use IRB to test functionality

```
$ cd <cloning path>
$ irb -I lib
```

add dummy data for the table

```
require 'Rspec_init'
require 'ostruct'
table = OpenStruct.new(
  header: [
    'primera',
    'segunda',
    'tercera'
  ],
  body: [
    [
      'first row first ',
      'first row second',
      'first row third'
    ],
    [
      'second row first',
      'second row second',
      'second row third'
    ]
  ],
  footer: [
    'footer first',
    'footer second',
    'footer third'
  ]
)
```

and then just

```
RspecInit::Main.new(table).to_html
```

voilá, a new file was created in the gem's root directory 😎
