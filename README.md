# Titan Cookbook

## Supported Platforms

* Ubuntu 14.04 LTS

## Supported Backends

* Persistit
* Titan + Cassandra: Local Server
* HBase (coming soon)

## Supported Indexing

* ElasticSearch (coming soon)
* Lucene (coming soon)

## Usage

### cayley::setup

Include `titan::default` and `titan::configure` in your node's `run_list`:

```json
{
  "run_list": [
    "recipe[titan::default]",
    "recipe[titan::configure]"
  ]
}
```

## Contributing

1. Fork the repository on Github
2. Create a named feature branch (i.e. `add-new-recipe`)
3. Write you change
4. Write tests for your change (if applicable)
5. Run the tests, ensuring they all pass
6. Submit a Pull Request

## License and Authors

Author:: Sean Stavropoulos (sean.stavro@gmail.com)
