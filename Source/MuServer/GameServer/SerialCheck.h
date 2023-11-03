#pragma once

#include "User.h"

class CSerialCheck
{
public:

	CSerialCheck();

	~CSerialCheck();

	void Init();

	bool CheckSerial(BYTE serial);

	BYTE GetRecvSerial();

	BYTE GetSendSerial();

private:

	BYTE m_RecvSerial;

	BYTE m_SendSerial;
};

extern CSerialCheck gSerialCheck[MAX_OBJECT];