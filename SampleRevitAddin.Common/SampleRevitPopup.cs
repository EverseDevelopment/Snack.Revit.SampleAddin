using System;
using Autodesk.Revit.Attributes;
using Autodesk.Revit.DB;
using Autodesk.Revit.UI;

namespace SampleRevitAddin.Common
{
    [Transaction(TransactionMode.Manual)]
    public class SampleRevitPopup : IExternalCommand
    {

        public Result Execute(ExternalCommandData commandData, ref string message, ElementSet elements)
        {
            try
            {
                Autodesk.Revit.UI.TaskDialog.Show("e-verse Sample Addin", "Looks like this worked!");
                return Result.Succeeded;
            }
            catch (Exception e)
            {
                Autodesk.Revit.UI.TaskDialog.Show("e-verse Sample Addin", $"Exception found: {e.Message}");
                return Result.Failed;
            }
        }
    }
}
