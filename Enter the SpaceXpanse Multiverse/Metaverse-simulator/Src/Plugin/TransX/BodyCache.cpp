/* Copyright © 2007-9 Steve Arch, Duncan Sharpe
** Copyright © 2011 atomicdryad - 'ENT' button & Pen allocation fix
** Copyright © 2013 Dimitris Gatsoulis (dgatsoulis) - Hacks
** Copyright © 2013 Szymon Ender (Enjo) - Auto-Min™, Auto-Center™ & other hacks
**
** X11 License ("MIT License")
**
** Permission is hereby granted, free of charge, to any person obtaining a copy
** of this software and associated documentation files (the "Software"), to deal
** in the Software without restriction, including without limitation the rights
** to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
** copies of the Software, and to permit persons to whom the Software is
** furnished to do so, subject to the following conditions:
**
** The above copyright notice and this permission notice shall be included in
** all copies or substantial portions of the Software.
**
** THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
** IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
** FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
** AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
** LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
** OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
** THE SOFTWARE.*/

#include "BodyCache.h"
#include "BodyProvider.h"

BodyCache::BodyCache()
: m_handle(NULL)
, m_gbody(NULL)
{}

BodyCache::BodyCache(OBJHANDLE handle, GBODY * gbody)
: m_handle(handle)
, m_gbody(gbody)
{}

BodyCache::~BodyCache(){}



bool BodyCache::NeedsUpdate( OBJHANDLE handle )
{
    //return true; // For testing
    return handle != m_handle;
}

GBODY * BodyCache::Gbody()
{
    return m_gbody;
}

/*
OBJHANDLE BodyCache::Handle()
{
    return m_handle;
}
*/
