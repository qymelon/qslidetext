/*******************************************************************************
 * Copyright (c) 2019, Induspotis, Inc.
 * All rights reserved.
 *
 * mainwindow : [description]
 *
 * filename : mainwindow.cc
 * author   : hubq(hubq@induspotis.com)
 * create   : 2019-08-16 02:08:34 UTC
 * modified : 2019-08-16 02:08:34 UTC
\******************************************************************************/

////////////////////////////////////////////////////////////////////////////////
// Headers
//
#include "mainwindow.h"
#include "ui_mainwindow.h"

#include "../src/qslidetext.h"

////////////////////////////////////////////////////////////////////////////////
// Typedefs & Constants
//

////////////////////////////////////////////////////////////////////////////////
// Inner Scope Objects
//

////////////////////////////////////////////////////////////////////////////////
// Classes
//
MainWindow::MainWindow(QWidget* parent)
  : QWidget(parent)
  , m_ui(new Ui::QSlideTextMainWindow())
{
  init();
}

void MainWindow::init()
{
  m_ui->setupUi(this);
}

////////////////////////////////////////////////////////////////////////////////
// Functions
//

////////////////////////////////// EOF /////////////////////////////////////////
