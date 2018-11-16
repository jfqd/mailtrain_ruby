## Usage

### Basic Use

First create a client instance:

```ruby
client = Mailtrain.new "http://xxxx.your.mailtrain.url", "your_access_token"
```

### Subscribe / Unsubscribe

Then you can subscribe or unsubscribe from a list:

```ruby
> client.subscribe list_id, "demo@demo.com", "My First Name", "My Last Name", "UTC", false, true
=> true
> client.unsubscribe list_id, "demo@demo.com"
=> false
> client.error
=> Invalid email address
```
subscribe
required: list_id, email
optional: first_name, last_name, timezone(default UTC), force_subscribe(default false), require_confirmation(default true)

unsubscribe
required: list_id, email

### Blacklist

To get blacklist:

```ruby
> client.blacklist 0, 10000, "demo@demo.com"
=> {:total=>2, :start=>0, :limit=>10000, :emails=>["demo@demo", "test@test"]}
```

### Add/delete email to blacklist

To get active subscriber count of a list:

```ruby
> client.block email
=> true
> client.unblock email
=> true
```