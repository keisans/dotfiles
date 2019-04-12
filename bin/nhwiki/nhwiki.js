#!/usr/bin/env node

var program = require('commander');
var inquirer = require('inquirer');
var axios = require('axios');
var qs = require('qs');
var cp = require('child_process');

var prompt = inquirer.prompt;

var basePath = 'https://nethackwiki.com/w/api.php?';

var escapeShell = function(cmd) {
  return '"'+cmd.replace(/(["'$`\\])/g,'\\$1')+'"';
};

program
  .version('0.1.0')
  .usage('[options] <query>')
  .option('-v --verbose', 'Verbose output')
  .parse(process.argv)

var options = {
  action: 'query',
  list: 'search',
  format: 'json',
  limit: 10
}

options.srsearch = program.args[0];

axios.get(`${basePath}${qs.stringify(options)}`)
  .then(function (res) {
    return res.data;
  })
  .then(function(data) {
    var options = data.query.search.map(function(entry){
      return entry.title;
    })
    return prompt([{
      type: 'list',
      choices: options,
      name: 'page',
      message: 'Which page?'
    }])
  })
  .then(function(answer){
    var parseOpts = {
      action: 'parse',
      page: answer.page,
      format: 'json',
      redirects: true
    }
    console.log(parseOpts);
    return axios.get(`${basePath}${qs.stringify(parseOpts)}`)
  })
  .then(function(response) {
    cp.exec(`echo ${escapeShell(response.data.parse.text["*"])} | lynx -dump -stdin`, function(error, stdout, stderror){
      console.log(stdout);
    });
  })
