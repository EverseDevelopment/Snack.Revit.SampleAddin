# Snack.Revit.Addin

## The Path

As architects-coders, BIM developers, or just power users that build projects or products in the AEC industry, many of us have tested multiple approaches to efficiently coding Revit add-ins. I struggled with this for a while. 

My path and I’m sure many others, started with Dynamo, then PyRevit since I started coding in Python. The ease of use, lack of boilerplate code, and language choice make this a good starting point. But, when complexities arise, tapping into Revit’s API directly is usually the way to go. To do this, we need to use .NET Framework and its flagship programming language: C#.

In that realm, we need to take care of building the application, packaging it, and deploying it in a frictionless, safe, and scalable way. The problem is there’s no standard recipe to do all this. In fact, [there are many](https://github.com/jeremytammik/VisualStudioRevitAddinWizard). So, how do we do it at e-verse? We’ve gone through plenty of iterations testing and improving our approach. We think sharing it may help other people in the industry who, like me, struggled with finding the most scalable and efficient way to do all this when we first started, using different tedious approaches to, for example, maintain an add-in for multiple Revit versions.

---

## Our Recipe

Our general add-in structure looks like this:

1. A git code repository
2. A .NET Framework solution containing multiple projects
    - The key here is to have different Class Library projects that compile a single Shared Project, so the code is the same but compiles targeting multiple Revit versions in a single operation
3. A set of NuGet dependencies
4. Post-build events to make debugging and releasing easier
5. A configuration file to manage settings and environment variables outside the main logic
6. CI/CD pipelines leveraging GitHub Actions to take care of releases for development, production, and any other environments needed

There are several templates and wizards to do this, but here we present our own. Take a look at this [article](https://blog.e-verse.com/build/coding-revit-add-ins-the-e-verse-way) about it.
