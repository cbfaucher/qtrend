/*
 * Copyright (c) 2007 9095-2458 Quebec Inc. All Rights Reserved.
 *
 * Althought this code is consider of good quality and has been tested, it is
 * provided to you WITHOUT guaranty of any kind.
 */
package com.quartz.qtrend.dom.aroon;


import lombok.*;

/**
 * The Aroon technical indicator information, for a given period.
 *
 * @author Christian
 * @since Quartz...
 */
@RequiredArgsConstructor
@AllArgsConstructor(access = AccessLevel.PRIVATE)
@Builder(toBuilder = true)
@Getter
public class Aroon
{
    final private IAroonParent parent;

    final private int period;

    @Setter private float aroonUp;
    @Setter private float aroonDown;

    public IAroonParent getParent()
    {
        return parent;
    }

    public float getOscillator()
    {
        return (aroonUp - aroonDown);
    }
}
