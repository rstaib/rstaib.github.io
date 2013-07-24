using dotless.Core;
using dotless.Core.Input;
using dotless.Core.configuration;
using System.Web.Optimization;

namespace MySite.Web.App_Start
{
    public class BundleConfig
    {
        public static void RegisterBundles(BundleCollection bundles)
        {
            bundles.Add(new ScriptBundle("~/cdn/scripts/base")
                .Include("~/cdn/scripts/jquery-{version}.js")
                .Include("~/cdn/scripts/bootstrap.js")
                .Include("~/cdn/scripts/bootstrap-*"));

            bundles.Add(new ScriptBundle("~/cdn/Scripts/validation")
                .Include("~/cdn/scripts/jquery.validate*"));

            var less = new Bundle("~/cdn/styles/base")
                .Include("~/cdn/content/bootstrap*")
                .Include("~/cdn/content/site.less");
            less.Transforms.Add(new LessTransform());
            less.Transforms.Add(new CssMinify());
            bundles.Add(less);
        }

        public class LessTransform
            : IBundleTransform
        {
            public void Process(BundleContext context, BundleResponse response)
            {
                var config = new DotlessConfiguration
                {
                    MinifyOutput = false,
                    ImportAllFilesAsLess = true,
                    CacheEnabled = false,
                    //#if DEBUG
                    //Logger = typeof (DiagnosticsLogger),
                    //#endif
                    LessSource = typeof(VirtualFileReader)
                };

                response.Content = Less.Parse(response.Content, config);
                response.ContentType = "text/css";
            }
        }
    }
}