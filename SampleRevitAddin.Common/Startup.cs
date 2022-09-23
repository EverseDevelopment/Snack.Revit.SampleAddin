using System;
using System.Reflection;
using System.Windows.Media.Imaging;
using System.IO;
using System.Diagnostics;
using Autodesk.Revit.Attributes;
using Autodesk.Revit.DB;
using Autodesk.Revit.UI;
using SampleRevitAddin.Resources;

namespace SampleRevitAddin.Common
{
    [Transaction(TransactionMode.Manual)]
    [Regeneration(RegenerationOption.Manual)]
    public class Startup : IExternalApplication
    {
        public Result OnShutdown(UIControlledApplication application)
        {
            return Result.Succeeded;
        }

        public Result OnStartup(UIControlledApplication application)
        {
            AddRibbonButtons(application);

            return Result.Succeeded;
        }

        BitmapImage NewBitmapImage(
            Assembly a, string imageName)
        {
            Stream s = a.GetManifestResourceStream(imageName);
            BitmapImage img = new BitmapImage();
            img.BeginInit();
            img.StreamSource = s;
            img.EndInit();
            return img;
        }

        private System.Windows.Media.ImageSource BmpImageSource(string embeddedPath)
        {
            Stream stream = this.GetType().Assembly.GetManifestResourceStream(embeddedPath);
            var decoder = new BmpBitmapDecoder(stream, BitmapCreateOptions.PreservePixelFormat, BitmapCacheOption.Default);
            return decoder.Frames[0];
        }

        private void AddRibbonButtons(UIControlledApplication application)
        {
            Assembly assembly = Assembly.GetExecutingAssembly();
            string executingAssemblyPath = assembly.Location;
            Debug.Print(executingAssemblyPath);
            string executingAssemblyName = assembly.GetName().Name;
            Console.WriteLine(executingAssemblyName);
            string eTabName = "e-verse";

            try
            {
                application.CreateRibbonTab(eTabName);
            }
            catch (Autodesk.Revit.Exceptions.ArgumentException)
            {
                // tab already exists
            }

            PushButtonData pbd = new PushButtonData("Sample", "Click Me", executingAssemblyPath, "SampleRevitAddin.Common.SampleRevitPopup");
            RibbonPanel panel = application.CreateRibbonPanel(eTabName, "Revit Snack");

            // Create the main button.
            PushButton pb = panel.AddItem(pbd) as PushButton;

            pb.ToolTip = "This is a sample Revit button";
            pb.LargeImage = ResourceImage.GetIcon("e-verselogo.png");
        }
    }
}