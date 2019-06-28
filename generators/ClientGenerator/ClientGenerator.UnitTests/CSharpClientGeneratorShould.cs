using System;
using System.Collections.Generic;
using ClientGenerator.Core;
using NUnit.Framework;

namespace ClientGenerator.UnitTests
{
    public class CSharpClientGeneratorShould
    {
        [TestCase("FooApi", @"        private FooApi fooApi;
        public FooApi FooApi
        {
            get => this.fooApi ?? (this.fooApi = new FooApi(this.authBasePath, this.clientId, this.clientSecret, this.accountId, this.scope));
            internal set => this.fooApi = value;
        }
")]
        [TestCase("BarApi", @"        private BarApi barApi;
        public BarApi BarApi
        {
            get => this.barApi ?? (this.barApi = new BarApi(this.authBasePath, this.clientId, this.clientSecret, this.accountId, this.scope));
            internal set => this.barApi = value;
        }
")]
        public void GenerateClientClassPropertyFromApiClassName(string apiClassName, string expected)
        {
            var generatedProperty = CSharpClientGenerator.GenerateProperty(apiClassName);

            Assert.That(generatedProperty, Is.EqualTo(expected));
        }

        [TestCase(new[] { "FooApi", "BarApi" }, @"using Salesforce.MarketingCloud.Client;

namespace Salesforce.MarketingCloud.Api
{
    public class Client
    {
        private readonly string authBasePath;
        private readonly string clientId;
        private readonly string clientSecret;
        private readonly string accountId;
        private readonly string scope;

        public Client(string authBasePath, string clientId, string clientSecret, string accountId, string scope)
        {
            this.authBasePath = authBasePath;
            this.clientId = clientId;
            this.clientSecret = clientSecret;
            this.accountId = accountId;
            this.scope = scope;
        }

        private FooApi fooApi;
        public FooApi FooApi
        {
            get => this.fooApi ?? (this.fooApi = new FooApi(this.authBasePath, this.clientId, this.clientSecret, this.accountId, this.scope));
            internal set => this.fooApi = value;
        }
        private BarApi barApi;
        public BarApi BarApi
        {
            get => this.barApi ?? (this.barApi = new BarApi(this.authBasePath, this.clientId, this.clientSecret, this.accountId, this.scope));
            internal set => this.barApi = value;
        }
    }
}")]
        public void GenerateClientClass(IEnumerable<string> apiClassNames, string expected)
        {
            var generatedClientClass = CSharpClientGenerator.GenerateClientClass(apiClassNames);
            Console.WriteLine(generatedClientClass);

            Assert.That(generatedClientClass, Is.EqualTo(expected));
        }
    }
}