﻿using System;

namespace Lumen
{
    [AttributeUsage(AttributeTargets.Class, AllowMultiple = false, Inherited = false)]
    public class NoValidatorAttribute : Attribute { }
}